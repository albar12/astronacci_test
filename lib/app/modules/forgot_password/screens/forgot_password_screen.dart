import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextEditingController emailController = TextEditingController();
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
                      return ForgotPasswordContentDesktop(
                        size: size,
                        emailController: emailController,
                      );
                    }
                    if (constraints.maxWidth < 600) {
                      return ForgotPasswordContent(
                        size: size,
                        emailController: emailController,
                      );
                    } else {
                      return ForgotPasswordContentTablet(
                        size: size,
                        emailController: emailController,
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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              username: state.data.forgotPasswordModel?.email ?? '',
              brand: AppConfig.brand,
              forgotPassword: true,
            ),
          ),
          (route) => true,
        );
      }
    }

    if (state is ForgotPasswordFailure) {
      if (state.data.error!.meta.message == "Data not found") {
        snackbarError(
          message: "Data tidak ditemukan",
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
