import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    this.isRegister,
    this.activation,
    required this.email,
  });

  final bool? isRegister;
  final bool? activation;
  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpCubit otpCubit;
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider<OtpCubit>.value(
      value: otpCubit,
      child: BlocListener<OtpCubit, OtpState>(
        listener: (context, state) {
          _handleListener(context, state);
        },
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (widget.isRegister == true) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/sign-up',
                (route) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(),
                ),
                (route) => true,
              );
            }
          },
          child: Scaffold(
            backgroundColor: ColorConstant.whiteColor,
            body: OtpContent(
              size: size,
              otpController: otpController,
              email: widget.email,
              isRegister: widget.isRegister,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    iniCubit();
    if (widget.isRegister != true) {
      otpCubit.requestOTPForgot(widget.email);
    }

    if (widget.activation == true) {
      otpCubit.requestOTP(widget.email);
    }
    super.initState();
  }

  void iniCubit() {
    otpCubit = OtpCubit(
      di.get<AuthRepository>(
        param1: di.get<AuthRemoteDatasource>(),
        param2: di.get<AuthLocalDatasource>(param1: di.get<BaseStorage>()),
      ),
      di.get<ProfileRepository>(
        param1: di.get<ProfileRemoteDatasource>(),
        param2: di.get<AuthLocalDatasource>(param1: di.get<BaseStorage>()),
      ),
    );
  }

  void _handleListener(BuildContext context, OtpState state) {
    var cubit = otpCubit;
    if (state is OtpLoaded) {
      if (state.data.requestOTP) {
        snackbarSuccess(
          message: state.data.responseMsg?.message ?? '',
          context: context,
        );
      }

      if (state.data.otpSucces) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotPasswordFormScreen(email: widget.email),
          ),
          (route) => true,
        );

        snackbarSuccess(
          message: state.data.responseMsg?.message ?? 'Berhasil Verifikasi',
          context: context,
        );
      }

      if (state.data.otpRegisterSucces) {
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
        snackbarSuccess(
          message: state.data.responseMsg?.message ?? 'Berhasil aktivasi Akun',
          context: context,
        );
      }
    }

    if (state is OtpFailure) {
      snackbarError(message: state.data.error!.meta.message, context: context);
    }
  }
}
