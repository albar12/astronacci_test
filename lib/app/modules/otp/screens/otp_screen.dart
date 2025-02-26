import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.username,
    required this.brand,
    this.registerGoogle,
    this.forgotPassword,
    this.removeAccount,
    this.deactiveAccount,
    this.fromAuth,
    this.aktivation,
    this.profileModel,
    this.initialRegisterModel,
  });
  final String username;
  final String brand;
  final bool? registerGoogle;
  final bool? forgotPassword;
  final bool? removeAccount;
  final bool? deactiveAccount;
  final bool? fromAuth;
  final bool? aktivation;
  final ProfileModel? profileModel;
  final InitialRegisterModel? initialRegisterModel;
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
            if (widget.forgotPassword == true) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(),
                ),
                (route) => false,
              );
            } else if (widget.fromAuth == true) {
              Navigator.pushNamedAndRemoveUntil(
                // ignore: use_build_context_synchronously
                context,
                '/auth',
                (route) => false,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/sign-up',
                (route) => false,
              );
            }
          },
          child: Scaffold(
            backgroundColor: ColorConstant.whiteColor,
            body: OtpContent(
              size: size,
              username: widget.username,
              brand: widget.brand,
              otpController: otpController,
              forgotPassword: widget.forgotPassword,
              removeAccount: widget.removeAccount,
              deactiveAccount: widget.deactiveAccount,
              fromAuth: widget.fromAuth,
              profileModel: widget.profileModel,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    iniCubit();
    if (widget.aktivation == true) {
      otpCubit.requestOTP(widget.username);
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
      if (state.data.requestSucces) {
        snackbarSuccess(
          message: state.data.meta?.message ?? '',
          context: context,
        );
      }

      if (state.data.otpSucces) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ForgotPasswordFormScreen(),
          ),
          (route) => true,
        );
      }

      if (state.data.otpRegisterSucces) {
        if (widget.fromAuth == true) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          snackbarSuccess(message: 'Berhasil aktivasi Akun', context: context);
        } else {
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder:
          //         (context) => SignUpPasswordScreen(
          //           initialRegisterModel: widget.initialRegisterModel,
          //         ),
          //   ),
          //   (route) => true,
          // );
        }
      }

      if (state.data.removeAccountSucces) {
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          '/auth',
          (route) => false,
        );
        snackbarSuccess(
          message:
              'Berhasil menghapus Akun, silahkan daftar kembali untuk mengakses BukuLoka Reader',
          context: context,
        );
      }

      if (state.data.deactiveAccountSucces) {
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          '/auth',
          (route) => false,
        );
        snackbarSuccess(
          message:
              'Berhasil menonaktifkan Akun, silahkan login kembali untuk mengakses BukuLoka Reader',
          context: context,
        );
      }
    }

    if (state is OtpFailure) {
      if (state.data.error!.meta.message ==
          "Request Failed: Please wait for a minute before requesting another OTP code") {
        snackbarError(
          message: 'Silahkan tunggu 1 menit untuk meminta kode OTP kembali.',
          context: context,
        );
      } else if (state.data.error!.meta.message ==
          "Validation Error: Invalid / expired code, please request again") {
        snackbarError(
          message:
              'Kesalahan Validasi: Kode tidak valid/kedaluwarsa, silakan minta lagi',
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
