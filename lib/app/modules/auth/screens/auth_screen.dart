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

              _backDialog(context);
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
    authCubit.getIsLogin();
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
      if (state.data.successLogin || state.data.isLogin == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }

    if (state is AuthFailure) {
      snackbarError(message: state.data.error!.meta.message, context: context);
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
