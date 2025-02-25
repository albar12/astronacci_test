import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class ForgotPasswordContentDesktop extends StatefulWidget {
  const ForgotPasswordContentDesktop({
    super.key,
    required this.size,
    required this.emailController,
  });
  final Size size;
  final TextEditingController emailController;
  @override
  State<ForgotPasswordContentDesktop> createState() => _ForgotPasswordContentDesktopState();
}

class _ForgotPasswordContentDesktopState extends State<ForgotPasswordContentDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ColorConstant.gradienColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: Center(
          child: _contentInput(context),
        ),
      ),
    );
  }

  Widget _contentInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: ColorConstant.blackColor.withOpacity(0.08),
            offset: const Offset(0, 0),
            blurRadius: 24,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/img_text_logo.png",
                    width: 200,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kamu Lupa Password?",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w900,
                      color: ColorConstant.blackColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Masukkan email Kamu, Kami akan mengirimkan kode untuk mengatur ulang password akun Kamu",
                textAlign: TextAlign.center,
                style: FontFamilyConstant.primaryFont.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Email",
                textAlign: TextAlign.left,
                style: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.blackColor3,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: widget.emailController,
                hint: "Masukan email",
                keyboardType: TextInputType.emailAddress,
                cursorColor: ColorConstant.greyColor15,
                hintStyle: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.greyColor15,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.greyColor16,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/auth',
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Kembali",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontFamilyConstant.primaryFont.copyWith(
                            color: ColorConstant.whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          if (widget.emailController.text.isEmpty) {
                            snackbarError(
                              title: 'Perhatian',
                              message: 'Mohon isi semua data wajib',
                              context: context,
                            );
                          } else {
                            context.read<ForgotPasswordCubit>().forgotPasswordSubmit(widget.emailController.text);
                          }
                        },
                        child: Text(
                          "Submit",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontFamilyConstant.primaryFont.copyWith(
                            color: ColorConstant.whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
