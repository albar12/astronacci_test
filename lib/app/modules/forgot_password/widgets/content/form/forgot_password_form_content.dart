import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class ForgotPasswordFormContent extends StatefulWidget {
  const ForgotPasswordFormContent({
    super.key,
    required this.size,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final Size size;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<ForgotPasswordFormContent> createState() => _ForgotPasswordFormContentState();
}

class _ForgotPasswordFormContentState extends State<ForgotPasswordFormContent> {
  bool obscureText = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
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
                    "Password Baru, Keamanan Baru!",
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
                "Masukkan password baru yang kuat untuk melindungi akun Kamu. Keamanan di tangan Kamu!",
                textAlign: TextAlign.center,
                style: FontFamilyConstant.primaryFont.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField(
                "Password",
                isMandatory: true,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                obscureText: obscureText,
                controller: widget.passwordController,
                hint: "Masukan password",
                cursorColor: ColorConstant.blueColor,
                keyboardType: TextInputType.text,
                hintStyle: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.greyColor15,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (obscureText) {
                      setState(() {
                        obscureText = false;
                      });
                    } else {
                      setState(() {
                        obscureText = true;
                      });
                    }
                  },
                  icon: Icon(
                    obscureText == false ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField(
                "Konfirmasi Password",
                isMandatory: true,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                obscureText: obscureConfirmPassword,
                controller: widget.confirmPasswordController,
                hint: "Masukan konfirmasi password",
                cursorColor: ColorConstant.blueColor,
                keyboardType: TextInputType.text,
                hintStyle: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.greyColor15,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (obscureConfirmPassword) {
                      setState(() {
                        obscureConfirmPassword = false;
                      });
                    } else {
                      setState(() {
                        obscureConfirmPassword = true;
                      });
                    }
                  },
                  icon: Icon(
                    obscureConfirmPassword == false ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: widget.size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (widget.passwordController.text.isEmpty || widget.confirmPasswordController.text.isEmpty) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Mohon isi semua data wajib',
                        context: context,
                      );
                    } else if (widget.passwordController.text.length < 6 || widget.passwordController.text.length > 50) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Panjang Password minimal 6 karakter & maksimal 50 karakter',
                        context: context,
                      );
                    } else if (widget.passwordController.text != widget.confirmPasswordController.text) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Password & Konfimari Password tidak sesuai',
                        context: context,
                      );
                    } else {
                      ForgotPasswordRequestDto forgotPasswordRequestDto = ForgotPasswordRequestDto(
                        password: widget.passwordController.text,
                        password_confirmation: widget.confirmPasswordController.text,
                      );

                      context.read<ForgotPasswordCubit>().forgotPasswordFormSubmit(forgotPasswordRequestDto);
                    }
                  },
                  child: Text(
                    "Submit",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerInputField(
    String label, {
    bool isMandatory = false,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.blackColor3,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        if (isMandatory)
          Text(
            "*",
            style: FontFamilyConstant.primaryFont.copyWith(
              color: ColorConstant.redColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
