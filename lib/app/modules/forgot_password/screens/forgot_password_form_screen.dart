import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class ForgotPasswordFormScreen extends StatefulWidget {
  const ForgotPasswordFormScreen({super.key});

  @override
  State<ForgotPasswordFormScreen> createState() => _ForgotPasswordFormScreenState();
}

class _ForgotPasswordFormScreenState extends State<ForgotPasswordFormScreen> {
  String brand = AppConfig.brand;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        _handleListener(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorConstant.whiteColor,
          body: state is ForgotPasswordLoading
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: ColorConstant.primaryColor,
                    size: 32,
                  ),
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    if (MediaQuery.of(context).orientation == Orientation.landscape) {
                      return ForgotPasswordFormContentDesktop(
                        size: size,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                      );
                    }
                    if (constraints.maxWidth < 600) {
                      return ForgotPasswordFormContent(
                        size: size,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                      );
                    } else {
                      return ForgotPasswordFormContent(
                        size: size,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                      );
                    }
                  },
                ),
        );
      },
    );
  }

  void _handleListener(BuildContext context, ForgotPasswordState state) {
    var cubit = context.read<ForgotPasswordCubit>();
    if (state is ForgotPasswordLoaded) {
      if (state.data.submitSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/auth',
          (route) => false,
        );
        snackbarSuccess(
          message: 'Berhasil mengganti password, silahkan Login menggunakan Password Anda yang baru',
          context: context,
        );
      }
    }

    if (state is ForgotPasswordFailure) {
      if (state.data.error!.meta.message == 'Expired token') {
        snackbarError(
          message: "Token kadaluarsa",
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
