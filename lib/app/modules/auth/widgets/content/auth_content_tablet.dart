import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class AuthContentTablet extends StatefulWidget {
  const AuthContentTablet({
    super.key,
    required this.size,
    required this.emailController,
    required this.passwordController,
    required this.state,
  });
  final Size size;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthState state;

  @override
  State<AuthContentTablet> createState() => _AuthContentTabletState();
}

class _AuthContentTabletState extends State<AuthContentTablet> {
  bool obscureText = true;

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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Center(child: _contentInput(context)),
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/img_text_logo.png", width: 200),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "Masuk",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    color: ColorConstant.blackColor3,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
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
              const SizedBox(height: 8),
              CustomTextFormField(
                isReadOnly: widget.state.data.dataIsFound ? true : false,
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Password",
                    textAlign: TextAlign.left,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor3,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                        (route) => true,
                      );
                    },
                    child: Text(
                      "Lupa Password?",
                      textAlign: TextAlign.left,
                      style: FontFamilyConstant.primaryFont.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: ColorConstant.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextFormField(
                obscureText: obscureText,
                controller: widget.passwordController,
                hint: "Masukan password",
                cursorColor: ColorConstant.greyColor15,
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
                    obscureText == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20,
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
                    if (widget.emailController.text.isEmpty ||
                        widget.passwordController.text.isEmpty) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Mohon isi semua data wajib',
                        context: context,
                      );
                    } else {
                      AuthRequestDto auth = AuthRequestDto(
                        username: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                      context.read<AuthCubit>().authLogin(auth);
                    }
                  },
                  child: Text(
                    "Masuk",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum Punya Akun?",
                    textAlign: TextAlign.left,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor3,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/sign-up',
                        (route) => true,
                      );
                    },
                    child: Text(
                      "Daftar",
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: FontFamilyConstant.primaryFont.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: ColorConstant.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
