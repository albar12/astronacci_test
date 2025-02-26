import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({super.key, this.profileModel, this.isHomeDetail});

  final ProfileModel? profileModel;
  final bool? isHomeDetail;

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<ChangeProfileCubit, ChangeProfileState>(
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
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/profile',
              (route) => false,
            );
          },
          child: Scaffold(
            backgroundColor: ColorConstant.whiteColor,
            appBar: AppBar(
              backgroundColor: ColorConstant.whiteColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/profile',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: Text(
                "Ubah Profile",
                style: FontFamilyConstant.primaryFont.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: size.width < 600 ? 18 : 22,
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(),
              ),
            ),
            body:
                state is ChangeProfileLoading
                    ? Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: ColorConstant.primaryColor,
                        size: 32,
                      ),
                    )
                    : LayoutBuilder(
                      builder: (context, constraints) {
                        if (MediaQuery.of(context).orientation ==
                            Orientation.landscape) {
                          return ChangeProfileContentDesktop(
                            size: size,
                            profileModel: widget.profileModel,
                            state: state,
                          );
                        }
                        if (constraints.maxWidth < 600) {
                          return ChangeProfileContent(
                            size: size,
                            profileModel: widget.profileModel,
                            state: state,
                          );
                        } else {
                          return ChangeProfileContentTablet(
                            size: size,
                            profileModel: widget.profileModel,
                            state: state,
                          );
                        }
                      },
                    ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Mengunci orientasi ke potrait atas
      DeviceOrientation
          .portraitDown, // Juga mengunci orientasi ke potrait bawah
    ]);
    // context.read<ChangeProfileCubit>().getProgramStudy();
    super.initState();
  }

  void _handleListener(BuildContext context, ChangeProfileState state) {
    var cubit = context.read<ChangeProfileCubit>();
    if (state is ChangeProfileLoaded) {
      if (state.data.isUpdated) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/profile',
          (route) => false,
        );

        snackbarSuccess(
          message: 'Berhasil melakukan update profile',
          context: context,
        );
      }
    }

    if (state is ChangeProfileFailure) {
      snackbarError(message: state.data.error!.meta.message, context: context);
    }
  }
}
