import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class SignUpPasswordScreen extends StatefulWidget {
  const SignUpPasswordScreen({
    super.key,
    this.initialRegisterModel,
  });

  final InitialRegisterModel? initialRegisterModel;

  @override
  State<SignUpPasswordScreen> createState() => _SignUpPasswordScreenState();
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController = TextEditingController();

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
                        return SignUpPasswordContent(
                          size: size,
                          passwordController: passwordController,
                          confirmationPasswordController: confirmationPasswordController,
                        );
                      }
                      if (constraints.maxWidth < 600) {
                        return SignUpPasswordContent(
                          size: size,
                          passwordController: passwordController,
                          confirmationPasswordController: confirmationPasswordController,
                        );
                      } else {
                        return SignUpPasswordContent(
                          size: size,
                          passwordController: passwordController,
                          confirmationPasswordController: confirmationPasswordController,
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
      if (state.data.signUpModel != null && state.data.createPasswordSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          '/auth',
          (route) => false,
        );
        snackbarSuccess(
          message: 'Berhasil membuat Akun, silahkan Login menggunakan Akun Anda',
          context: context,
        );
      }
    }

    if (state is SignUpFailure) {
      snackbarError(
        message: state.data.error!.meta.message,
        context: context,
      );
    }
  }
}
