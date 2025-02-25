import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        _handleListener(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: ColorConstant.gradienColor,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/img_app_logo.png',
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/img_splash_text.png',
                    ),
                    const SizedBox(height: 24),
                    Visibility(
                      visible: size.width < 600 ? true : false,
                      child: const CustomLoading(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // context.read<SplashCubit>().getProfile();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        '/auth',
        (route) => false,
      );
    });
    super.initState();
  }

  void _handleListener(BuildContext context, SplashState state) {
    var cubit = context.read<SplashCubit>();
    if (state is SplashLoaded) {
      if (state.data.isGetProfileSuccess) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            '/home',
            (route) => false,
          );
        });
      }

      if (state.data.isLogin == true) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            '/home',
            (route) => false,
          );
        });
      }

      if (state.data.isLogin == false) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            '/auth',
            (route) => false,
          );
        });
      }

      if (state.data.refreshTokenSuccess) {
        cubit.getProfile();
      }
    }

    if (state is SplashError) {
      if (state.data.error!.meta.message == 'Koneksi Bermasalah, Silahkan Coba Lagi') {
        cubit.getIsLogin();
      } else {
        if (state.data.error!.meta.message == 'Token not found' || state.data.error!.meta.message == 'Unauthorized') {
          // cubit.refreshToken();
          Navigator.pushNamedAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            '/auth',
            (route) => false,
          );
        } else {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamedAndRemoveUntil(
              // ignore: use_build_context_synchronously
              context,
              '/auth',
              (route) => false,
            );
          });
        }
      }
    }
  }
}
