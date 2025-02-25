import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({
    super.key,
    this.isFromBundle,
    this.isFree,
    required this.hasBeenDisconnected,
    this.id,
    this.title,
  });
  final bool? isFromBundle;
  final bool? isFree;
  final bool hasBeenDisconnected;

  final int? id;
  final String? title;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  late BookDetailCubit bookDetailCubit;
  late Stream<List<ConnectivityResult>> _connectivityStream;
  late StreamSubscription<List<ConnectivityResult>>
  _connectivityStreamSubscription;

  bool hasBeenDisconnected = false;

  bool isPhysicalDevice = true;

  String _formattedTimeZone = "";

  bool isExpired = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider<BookDetailCubit>.value(
      value: bookDetailCubit,
      child: BlocConsumer<BookDetailCubit, BookDetailState>(
        listener: (context, state) {
          _handleListener(context, state);
        },
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {},
            child: Scaffold(
              backgroundColor: ColorConstant.whiteColor,
              appBar: AppBar(
                backgroundColor: ColorConstant.whiteColor,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                title: Text(
                  '',
                  overflow: TextOverflow.ellipsis,
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: size.width < 600 ? 18 : 22,
                  ),
                ),
              ),
              body:
                  state is BookDetailLoading ||
                          state is BookDetailFree ||
                          state is BookDetailLocal ||
                          (state.data.error?.meta.message == 'Data not found')
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
                            return BookDetailContentTablet(
                              size: size,
                              state: state,
                              isFromBundle: widget.isFromBundle,
                              hasBeenDisconnected: widget.hasBeenDisconnected,
                              isFree: widget.isFree,
                              formattedTimeZone: _formattedTimeZone,
                              isPhysicalDevice: isPhysicalDevice,
                            );
                          }
                          if (constraints.maxWidth < 600) {
                            return BookDetailContent(
                              size: size,
                              state: state,
                              isFromBundle: widget.isFromBundle,
                              hasBeenDisconnected: widget.hasBeenDisconnected,
                              isFree: widget.isFree,
                              formattedTimeZone: _formattedTimeZone,
                              isPhysicalDevice: isPhysicalDevice,
                              isExpired: isExpired,
                            );
                          } else {
                            return BookDetailContentTablet(
                              size: size,
                              state: state,
                              isFromBundle: widget.isFromBundle,
                              hasBeenDisconnected: widget.hasBeenDisconnected,
                              isFree: widget.isFree,
                              formattedTimeZone: _formattedTimeZone,
                              isPhysicalDevice: isPhysicalDevice,
                            );
                          }
                        },
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
    initCubit();
    connectivityListener();

    super.initState();
  }

  @override
  void dispose() {
    _connectivityStreamSubscription.cancel();
    super.dispose();
  }

  void initCubit() {
    bookDetailCubit = BookDetailCubit(
      di.get<AuthRepository>(
        param1: di.get<AuthRemoteDatasource>(),
        param2: di.get<AuthLocalDatasource>(param1: di.get<BaseStorage>()),
      ),
    );
  }

  void _handleListener(BuildContext context, BookDetailState state) async {
    var cubit = bookDetailCubit;
  }

  connectivityListener() {
    _connectivityStream = Connectivity().onConnectivityChanged;
    _connectivityStreamSubscription = _connectivityStream.listen((event) {
      if (event.contains(ConnectivityResult.none)) {
        setState(() {
          hasBeenDisconnected = true;
        });
        customWarningLog('No Internet Connection');
      } else {
        setState(() {
          hasBeenDisconnected = false;
        });
        customInfoLog('Connected ${event.first}');
      }
    });

    checkInitialConnection();
  }

  void checkInitialConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      setState(() {
        hasBeenDisconnected = true;
      });
    } else {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        setState(() {
          hasBeenDisconnected = true;
        });
      } else {
        setState(() {
          hasBeenDisconnected = false;
        });
      }
    }
  }
}
