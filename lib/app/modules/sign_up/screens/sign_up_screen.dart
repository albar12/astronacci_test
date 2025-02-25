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
            body: state is SignUpLoading
                ? Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: ColorConstant.primaryColor,
                      size: 32,
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      if (MediaQuery.of(context).orientation == Orientation.landscape) {
                        return SignUpContentTablet(
                          size: size,
                          emailController: emailController,
                          nameController: nameController,
                          phoneController: phoneController,
                        );
                      }
                      if (constraints.maxWidth < 600) {
                        return SignUpContent(
                          size: size,
                          emailController: emailController,
                          nameController: nameController,
                          phoneController: phoneController,
                        );
                      } else {
                        return SignUpContent(
                          size: size,
                          emailController: emailController,
                          nameController: nameController,
                          phoneController: phoneController,
                        );
                      }
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
      if (state.data.initialRegister) {
        if (state.data.initialRegisterModel?.token != null && state.data.initialRegisterModel?.token != '') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPasswordScreen(
                initialRegisterModel: state.data.initialRegisterModel,
              ),
            ),
            (route) => true,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                username: state.data.registerRequestDto?.email ?? '',
                brand: AppConfig.brand,
                initialRegisterModel: state.data.initialRegisterModel,
              ),
            ),
            (route) => true,
          );
        }
      }
    }

    if (state is SignUpFailure) {
      if (state.data.error!.meta.message == 'Pending activation: Please verify using OTP') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              username: state.data.registerRequestDto?.email ?? '',
              brand: AppConfig.brand,
              initialRegisterModel: state.data.initialRegisterModel,
            ),
          ),
          (route) => true,
        );
      } else {
        if (state.data.error!.meta.message == "Registration not allowed: Email / phone already registered") {
          snackbarError(
            message: "Pendaftaran tidak diperbolehkan: Email/telepon sudah terdaftar",
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
}
