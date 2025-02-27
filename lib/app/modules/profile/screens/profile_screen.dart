import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit profileCubit;
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider<ProfileCubit>.value(
      value: profileCubit,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          _handleListener(context, state);
        },
        builder: (context, state) {
          return Scaffold(
            body:
                state is ProfileLoading
                    ? Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: ColorConstant.primaryColor,
                        size: 32,
                      ),
                    )
                    : LayoutBuilder(
                      builder: (context, constraints) {
                        return ProfileContent(
                          size: size,
                          profileState: state,
                          namaController: namaController,
                          emailController: emailController,
                          phoneController: phoneController,
                        );
                      },
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
    profileCubit.getProfile();
    super.initState();
  }

  void iniCubit() {
    profileCubit = ProfileCubit(
      di.get<ProfileRepository>(
        param1: di.get<ProfileRemoteDatasource>(),
        param2: di.get<AuthLocalDatasource>(param1: di.get<BaseStorage>()),
      ),
      di.get<AuthRepository>(
        param1: di.get<AuthRemoteDatasource>(),
        param2: di.get<AuthLocalDatasource>(param1: di.get<BaseStorage>()),
      ),
    );
  }

  void _handleListener(BuildContext context, ProfileState state) {
    var cubit = profileCubit;
    if (state is ProfileLoaded) {
      if (state.data.updateSuccess) {
        cubit.getProfile();
      }

      if (state.data.isLogout) {
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          '/auth',
          (route) => false,
        );
      }
    }

    if (state is ProfileFailure) {
      snackbarError(message: state.data.error!.meta.message, context: context);
    }
  }
}
