import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '/path.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
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
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              title: Text(
                "Ubah Password",
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
            body: state is ChangePasswordLoading
                ? Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: ColorConstant.primaryColor,
                      size: 32,
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      if (MediaQuery.of(context).orientation == Orientation.landscape) {
                        return ChangePasswordContentDesktop(
                          size: size,
                        );
                      }
                      if (constraints.maxWidth < 600) {
                        return ChangePasswordContent(
                          size: size,
                        );
                      } else {
                        return ChangePasswordContentTablet(
                          size: size,
                        );
                      }
                    },
                  ),
          ),
        );
      },
    );
  }

  void _handleListener(BuildContext context, ChangePasswordState state) {
    var cubit = context.read<ChangePasswordCubit>();
    if (state is ChangePasswordLoaded) {
      if (state.data.isSuccess) {
        context.read<BottomNavbarCubit>().changeIndex(3);
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/profile',
          (route) => false,
        );
        snackbarSuccess(
          message: 'Berhasil melakukan update password',
          context: context,
        );
      }
    }

    if (state is ChangePasswordFailure) {
      snackbarError(
        message: state.data.error!.meta.message,
        context: context,
      );
    }
  }
}
