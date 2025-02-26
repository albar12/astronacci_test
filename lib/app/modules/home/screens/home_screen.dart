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
  RefreshController refreshController = RefreshController();

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _sectionKey1 = GlobalKey();
  final GlobalKey _sectionTopKey = GlobalKey();

  bool _isVisible = false;

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
                          return HomeContent(
                            size: size,
                            state: state,
                            scrollController: _scrollController,
                            sectionKey1: _sectionKey1,
                            sectionTopKey: _sectionTopKey,
                            homeCubit: homeCubit,
                          );
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
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    _scrollController.dispose();
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

    if (state is HomeLoaded) {}

    if (state is HomeFailure) {
      snackbarError(message: state.data.error!.meta.message, context: context);
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
}
