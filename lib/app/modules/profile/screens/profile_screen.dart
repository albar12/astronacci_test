import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    this.successUpdate,
  });

  final bool? successUpdate;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Stream<List<ConnectivityResult>> _connectivityStream;
  late StreamSubscription<List<ConnectivityResult>> _connectivityStreamSubscription;

  bool hasBeenDisconnected = false;

  String _version = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
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
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
          child: Scaffold(
            backgroundColor: ColorConstant.whiteColor,
            appBar: AppBar(
              backgroundColor: ColorConstant.whiteColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: Text(
                "Profile",
                style: FontFamilyConstant.primaryFont.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: size.width < 600 ? 18 : 22,
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(),
              ),
            ),
            body: state is ProfileLoading
                ? Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: ColorConstant.primaryColor,
                      size: 32,
                    ),
                  )
                : hasBeenDisconnected
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/img_no_internet_ilustration.png",
                              width: 300,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "No Internet Connection",
                              style: FontFamilyConstant.primaryFont.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          if (MediaQuery.of(context).orientation == Orientation.landscape) {
                            return ProfileContentDesktop(
                              size: size,
                              profileState: state,
                              version: _version,
                            );
                          }
                          if (constraints.maxWidth < 600) {
                            return ProfileContent(
                              size: size,
                              profileState: state,
                              version: _version,
                            );
                          } else {
                            return ProfileContentTablet(
                              size: size,
                              profileState: state,
                              version: _version,
                            );
                          }
                        },
                      ),
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _version,
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontSize: size.width < 600 ? 12 : 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Mengunci orientasi ke potrait atas
      DeviceOrientation.portraitDown, // Juga mengunci orientasi ke potrait bawah
    ]);
    if (widget.successUpdate == true) {
      snackbarSuccess(
        message: 'Berhasil melakukan update profile',
        context: context,
      );
    }
    _getAppVersion();
    connectivityListener();
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  void _handleListener(BuildContext context, ProfileState state) {
    var cubit = context.read<ProfileCubit>();
    if (state is ProfileLoaded) {
      setState(() {
        hasBeenDisconnected = false;
      });
      if (state.data.isLogout) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/auth',
          (route) => false,
        );
      }
    }

    if (state is ProfileFailure) {
      if (state.data.error!.meta.message == 'Koneksi Bermasalah, Silahkan Coba Lagi') {
        setState(() {
          hasBeenDisconnected = true;
        });
      } else {
        if (state.data.error!.meta.message != 'Token not found' || state.data.error!.meta.message != 'Unauthorized') {
          Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            '/auth',
            (route) => false,
          );
        } else {
          snackbarError(
            message: state.data.error!.meta.message,
            context: context,
          );
        }
      }
    }
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
  }

  // Mengambil informasi versi aplikasi
  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _version = 'Version: ${packageInfo.version}';
    });
  }
}
