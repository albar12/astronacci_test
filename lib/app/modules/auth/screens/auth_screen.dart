import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.successCreate});

  final bool? successCreate;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthCubit authCubit;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider<AuthCubit>.value(
      value: authCubit,
      child: BlocConsumer<AuthCubit, AuthState>(
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
              if (state.data.dataIsFound) {
                passwordController.clear();
              } else {
                _backDialog(context);
              }
            },
            child: Scaffold(
              backgroundColor: ColorConstant.whiteColor,
              body:
                  state is AuthLoading
                      ? Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: ColorConstant.primaryColor,
                          size: 32,
                        ),
                      )
                      : LayoutBuilder(
                        builder: (context, constraints) {
                          return AuthContent(
                            size: size,
                            emailController: emailController,
                            passwordController: passwordController,
                            state: state,
                          );
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
    iniCubit();
    authCubit.getLastLogin();
    super.initState();
  }

  void iniCubit() {
    authCubit = AuthCubit(
      di.get<AuthRepository>(
        param1: di.get<AuthRemoteDatasource>(),
        param2: di.get<AuthLocalDatasource>(param1: di.get<BaseStorage>()),
      ),
    );
  }

  void _handleListener(BuildContext context, AuthState state) {
    var cubit = authCubit;
    if (state is AuthLoaded) {
      if (state.data.successLogin) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }

      if (state.data.truncateSuccess) {
        cubit.authLogin(state.data.authDto!);
      }
    }

    if (state is AuthFailure) {
      if (state.data.error!.meta.message ==
          "Pending activation: Please verify using OTP") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder:
                (context) => OtpScreen(
                  username: state.data.emailOTP ?? '',
                  brand: AppConfig.brand,
                  fromAuth: true,
                  // aktivation: true,
                ),
          ),
          (route) => false,
        );
      } else if (state.data.error!.meta.message ==
          "Data found, but account is not active") {
        if (state.data.isActivation) {
          _activationDialog(context);
        }
      } else {
        if (state.data.error!.meta.message == 'Data not found') {
          snackbarError(message: 'Data tidak ditemukan', context: context);
        } else if (state.data.error!.meta.message ==
            'Login failed: Wrong password') {
          snackbarError(
            message: 'Login gagal: Password salah',
            context: context,
          );
        } else if (state.data.error!.meta.message ==
            'Pending activation: Please verify using OTP') {
          snackbarError(
            message: 'Aktivasi tertunda: Harap verifikasi menggunakan OTP',
            context: context,
          );
        } else if (state.data.error!.meta.message ==
                'Data found, but account is deleted' ||
            state.data.error!.meta.message ==
                'Data found, but account is no longer accessible') {
          snackbarError(
            message:
                'Akun sudah terhapus, silahkan daftar kembali untuk mengakses BukuLoka Reader',
            context: context,
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

  Future<dynamic> _activationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Icon(
              Icons.warning,
              color: ColorConstant.yellowColor,
              size: 50,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ingin mengaktifkan akun ini kembali?',
                  textAlign: TextAlign.center,
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Proses ini memastikan akun dapat digunakan kembali tanpa kehilangan data sebelumnya.',
                  textAlign: TextAlign.center,
                  style: FontFamilyConstant.primaryFont.copyWith(fontSize: 14),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .redColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Batal',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        authCubit.accountActivation();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .blueColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Iya',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
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
