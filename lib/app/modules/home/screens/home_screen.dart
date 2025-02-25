import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late HomeCubit homeCubit;
  late Stream<List<ConnectivityResult>> _connectivityStream;
  late StreamSubscription<List<ConnectivityResult>>
  _connectivityStreamSubscription;

  RefreshController refreshController = RefreshController();

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _sectionKey1 = GlobalKey();
  final GlobalKey _sectionTopKey = GlobalKey();

  TabController? _controller;
  final PageController _pageController = PageController();
  int tabCount = 1;

  bool _isVisible = false;

  bool hasBeenDisconnected = false;
  bool firstReload = true;

  String _formattedTimeZone = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider<HomeCubit>.value(
      value: homeCubit,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          _handleListener(context, state);
        },
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
              _backDialog(context);
            },
            child: Scaffold(
              backgroundColor: ColorConstant.whiteColor,
              body:
                  state is HomeLoading || state is HomeGetFreeBook
                      ? Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: ColorConstant.primaryColor,
                          size: 32,
                        ),
                      )
                      : LayoutBuilder(
                        builder: (context, constraints) {
                          if (MediaQuery.of(context).orientation ==
                              Orientation.landscape) {
                            return HomeContentDektop(
                              size: size,
                              state: state,
                              controller: _controller,
                              scrollController: _scrollController,
                              sectionKey1: _sectionKey1,
                              sectionTopKey: _sectionTopKey,
                              pageController: _pageController,
                              isDesktop: true,
                              firstReload: firstReload,
                            );
                          }
                          if (constraints.maxWidth < 600) {
                            return HomeContent(
                              size: size,
                              state: state,
                              controller: _controller,
                              scrollController: _scrollController,
                              sectionKey1: _sectionKey1,
                              sectionTopKey: _sectionTopKey,
                              pageController: _pageController,
                              isDesktop: false,
                              firstReload: firstReload,
                              homeCubit: homeCubit,
                              formattedTimeZone: _formattedTimeZone,
                            );
                          } else {
                            return HomeContentTablet(
                              size: size,
                              state: state,
                              controller: _controller,
                              scrollController: _scrollController,
                              sectionKey1: _sectionKey1,
                              sectionTopKey: _sectionTopKey,
                              pageController: _pageController,
                              isDesktop: true,
                              firstReload: firstReload,
                            );
                          }
                        },
                      ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: _isVisible,
                    child: CircleAvatar(
                      backgroundColor: ColorConstant.primaryColor,
                      child: IconButton(
                        color: ColorConstant.whiteColor,
                        onPressed: () {
                          _scrollToTop(_sectionTopKey);
                        },
                        icon: const Icon(Icons.arrow_circle_up),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: ColorConstant.primaryColor,
                    child: IconButton(
                      color: ColorConstant.whiteColor,
                      onPressed: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      icon: const Icon(Icons.sync),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: ColorConstant.primaryColor,
                    child: IconButton(
                      color: ColorConstant.whiteColor,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          // ignore: use_build_context_synchronously
                          context,
                          '/profile',
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.person),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Mengunci orientasi ke potrait atas
      DeviceOrientation
          .portraitDown, // Juga mengunci orientasi ke potrait bawah
    ]);
    iniCubit();
    connectivityListener();
    _initializeController();
    _convertTimeZone();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    _scrollController.dispose();
    _controller!.dispose();
    _pageController.dispose();
    _connectivityStreamSubscription.cancel();
    super.dispose();
  }

  void iniCubit() {
    homeCubit = HomeCubit(
      di.get<AuthRepository>(
        param1: di.get<AuthRemoteDatasource>(),
        param2: di.get<AuthLocalDatasource>(param1: di.get<BaseStorage>()),
      ),
    );
  }

  void _handleListener(BuildContext context, HomeState state) {
    var cubit = homeCubit;

    if (state is HomeGetFreeBook) {
      if (state.data.successGetFreebook) {
        setState(() {
          firstReload = false;
        });
      }
    }

    if (state is HomeLoaded) {
      if (state.data.tabList != null || state.data.tabList!.length > tabCount) {
        setState(() {
          tabCount = state.data.tabList!.length;
        });
        _initializeController();
      }

      if (state.data.fromLocal) {}

      if (state.data.deleteRecentSuccess) {}

      if (state.data.refreshTokenSuccess) {}
    }

    if (state is HomeFailure) {
      if (state.data.error!.meta.message ==
          'Koneksi Bermasalah, Silahkan Coba Lagi') {
      } else {
        if (state.data.error!.meta.message == 'Token not found' ||
            state.data.error!.meta.message == 'Unauthorized') {
          // cubit.refreshToken();
          Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
        } else {
          if (state.data.error!.meta.message != 'Route not found') {
            snackbarError(
              message: state.data.error!.meta.message,
              context: context,
            );
          }
        }
      }
    }
  }

  void _scrollListener() {
    if (_scrollController.offset >= 200 && !_isVisible) {
      setState(() {
        _isVisible = true;
      });
    } else if (_scrollController.offset < 200 && _isVisible) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  // Fungsi untuk kembali ke atas
  void _scrollToTop(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.of(context).position.ensureVisible(
        context.findRenderObject()!,
        alignment: 0.0, // Scroll ke bagian atas
        duration: const Duration(seconds: 1), // Durasi animasi
      );
    }
  }

  void _initializeController() {
    _controller = TabController(length: tabCount, vsync: this);
  }

  connectivityListener() {
    var cubit = homeCubit;
    _connectivityStream = Connectivity().onConnectivityChanged;
    _connectivityStreamSubscription = _connectivityStream.listen((event) {
      if (event.contains(ConnectivityResult.none)) {
        setState(() {
          firstReload = true;
        });

        customWarningLog('No Internet Connection');
      } else {
        customInfoLog('Connected ${event.first}');
      }
    });

    checkInitialConnection();
  }

  void checkInitialConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      setState(() {
        firstReload = true;
        hasBeenDisconnected = true;
      });
    } else {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        setState(() {
          firstReload = true;
          hasBeenDisconnected = true;
        });
      } else {
        setState(() {
          hasBeenDisconnected = false;
        });
      }
    }
  }

  Future<dynamic> _backDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: Icon(
              Icons.info_outline_rounded,
              size: 50,
              color: ColorConstant.redColor,
            ),
            title: const Text(
              'Ingin keluar aplikasi?',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Apa Anda yakin ingin keluar aplikasi?',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Kembali tanpa konfirmasi
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  } // Konfirmasi untuk kembali
                },
                child: const Text('Yes'),
              ),
            ],
          ),
    );
  }

  Future<void> _convertTimeZone() async {
    tz.initializeTimeZones();

    var timezone = await const TimeZonLocalService().getTimeZone();

    // Zona waktu Jakarta (Asia/Jakarta)
    final jakartaTimeZone = tz.getLocation(timezone ?? '');

    // Mendapatkan waktu saat ini di zona waktu Jakarta
    final jakartaTime = tz.TZDateTime.now(jakartaTimeZone);

    // Format waktu untuk WIB, WITA, WIT
    String timeZoneAbbreviation = _getTimezoneAbbreviation(jakartaTimeZone);

    setState(() {
      _formattedTimeZone = timeZoneAbbreviation;
    });
  }

  String _getTimezoneAbbreviation(tz.Location location) {
    final now = tz.TZDateTime.now(location);

    // Dapatkan offset UTC
    final offset = now.timeZoneOffset;

    // Menentukan WIB, WITA, WIT berdasarkan offset UTC
    if (offset.inHours == 7) {
      return "WIB"; // Jakarta (UTC+7)
    } else if (offset.inHours == 8) {
      return "WITA"; // Bali (UTC+8)
    } else if (offset.inHours == 9) {
      return "WIT"; // Papua (UTC+9)
    } else {
      return ""; // Jika offset tidak dikenal
    }
  }
}
