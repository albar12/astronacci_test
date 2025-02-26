import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        _handleListener(context, state);
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/auth',
              (route) => false,
            );
          },
          child: Scaffold(
            backgroundColor: ColorConstant.whiteColor,
            body:
                state is SignUpLoading
                    ? Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: ColorConstant.primaryColor,
                        size: 32,
                      ),
                    )
                    : LayoutBuilder(
                      builder: (context, constraints) {
                        return SignUpContent(
                          size: size,
                          emailController: emailController,
                          nameController: nameController,
                          phoneController: phoneController,
                          passwordController: passwordController,
                          confirmationPasswordController:
                              confirmationPasswordController,
                        );
                      },
                    ),
          ),
        );
      },
    );
  }

  void _handleListener(BuildContext context, SignUpState state) {
    var cubit = context.read<SignUpCubit>();
    if (state is SignUpLoaded) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder:
              (context) => OtpScreen(
                username: state.data.registerRequestDto?.email ?? '',
                brand: AppConfig.brand,
              ),
        ),
        (route) => true,
      );
      snackbarSuccess(
        message: state.data.responseMsg?.message ?? "Berhasil Register!",
        context: context,
      );
    }

    if (state is SignUpFailure) {
      snackbarError(message: state.data.error!.meta.message, context: context);
    }
  }
}
