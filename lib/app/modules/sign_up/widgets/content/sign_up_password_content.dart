import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class SignUpPasswordContent extends StatefulWidget {
  const SignUpPasswordContent({
    super.key,
    required this.size,
    required this.passwordController,
    required this.confirmationPasswordController,
  });

  final Size size;
  final TextEditingController passwordController;
  final TextEditingController confirmationPasswordController;

  @override
  State<SignUpPasswordContent> createState() => _SignUpPasswordContentState();
}

class _SignUpPasswordContentState extends State<SignUpPasswordContent> {
  bool obscureText = true;
  bool obscureCP = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
      width: widget.size.width,
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
          vertical: 16,
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
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
                obscureText: obscureCP,
                controller: widget.confirmationPasswordController,
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
                    if (obscureCP) {
                      setState(() {
                        obscureCP = false;
                      });
                    } else {
                      setState(() {
                        obscureCP = true;
                      });
                    }
                  },
                  icon: Icon(
                    obscureCP == false ? Icons.visibility : Icons.visibility_off,
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
                    if (widget.passwordController.text.length < 6 || widget.passwordController.text.length > 50) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Panjang password minimal 6 dan maksimal 50 karakter',
                        context: context,
                      );
                    } else if (widget.confirmationPasswordController.text != widget.passwordController.text) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Password dan Konfimasi Password tidak sesuai',
                        context: context,
                      );
                    } else {
                      _backDialog(context);
                    }
                  },
                  child: Text(
                    "Buat akun",
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

  Future<dynamic> _backDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Icon(
              Icons.warning,
              color: ColorConstant.yellowColor,
              size: 50,
            ),
            Text(
              "Konfirmasi Data",
              textAlign: TextAlign.center,
              style: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        content: Text(
          'Apakah data yang Anda isi sudah benar?',
          textAlign: TextAlign.center,
          style: FontFamilyConstant.primaryFont.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.redColor, // Warna latar belakang tombol
                ),
                child: Text(
                  'Tidak',
                  style: TextStyle(
                    color: ColorConstant.whiteColor,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  PasswordRequestDto passwordRequestDto = PasswordRequestDto(
                    password: widget.passwordController.text,
                    password_confirmation: widget.confirmationPasswordController.text,
                  );

                  context.read<SignUpCubit>().createPassword(passwordRequestDto);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.blueColor, // Warna latar belakang tombol
                ),
                child: Text(
                  'Iya',
                  style: TextStyle(
                    color: ColorConstant.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
