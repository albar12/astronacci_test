import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class SignUpContent extends StatefulWidget {
  const SignUpContent({
    super.key,
    required this.size,
    required this.emailController,
    required this.nameController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmationPasswordController,
  });

  final Size size;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmationPasswordController;

  @override
  State<SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor3,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun?",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/auth',
                        (route) => false,
                      );
                    },
                    child: Text(
                      " Masuk",
                      style: FontFamilyConstant.primaryFont.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: ColorConstant.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  const SizedBox(width: 12),
                  Text(
                    "Atau",
                    textAlign: TextAlign.center,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: ColorConstant.greyColor14,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),
              _headerInputField("Nama Lengkap", isMandatory: true),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: widget.nameController,
                hint: "Masukan Nama Lengkap",
                cursorColor: ColorConstant.greyColor15,
                keyboardType: TextInputType.text,
                hintStyle: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.greyColor15,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField("Email", isMandatory: true),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: widget.emailController,
                hint: "Masukan Email",
                cursorColor: ColorConstant.blueColor,
                keyboardType: TextInputType.emailAddress,
                hintStyle: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.greyColor15,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField("No. WhatsApp", isMandatory: true),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: widget.phoneController,
                hint: "Masukan no. whatsapp",
                cursorColor: ColorConstant.blueColor,
                keyboardType: TextInputType.phone,
                hintStyle: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.greyColor15,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField("Password", isMandatory: true),
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
                    obscureText == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField("Konfirmasi Password", isMandatory: true),
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
                    obscureCP == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.greyColor9,
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
                          style: FontFamilyConstant.primaryFont.copyWith(
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
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
                          final bool emailValid = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                          ).hasMatch(widget.emailController.text);

                          if (widget.nameController.text.isEmpty ||
                              widget.emailController.text.isEmpty ||
                              widget.passwordController.text.isEmpty ||
                              widget
                                  .confirmationPasswordController
                                  .text
                                  .isEmpty ||
                              widget.phoneController.text.isEmpty) {
                            snackbarError(
                              title: 'Perhatian',
                              message: 'Mohon isi semua data wajib',
                              context: context,
                            );
                          } else if (widget.nameController.text.length > 50) {
                            snackbarError(
                              title: 'Perhatian',
                              message:
                                  'Nama tidak boleh melebihi dari 50 huruf',
                              context: context,
                            );
                          } else if (!emailValid) {
                            snackbarError(
                              title: 'Perhatian',
                              message: 'Format email tidak sesuai',
                              context: context,
                            );
                          } else if (widget.passwordController.text.length <
                              6) {
                            snackbarError(
                              title: 'Perhatian',
                              message: 'Panjang Password Minimal 6 Karakter!',
                              context: context,
                            );
                          } else if (widget.passwordController.text !=
                              widget.confirmationPasswordController.text) {
                            snackbarError(
                              title: 'Perhatian',
                              message:
                                  'Password Dan Konfirmasi Password Tidak Sesuai!',
                              context: context,
                            );
                          } else {
                            _backDialog(context);
                          }
                        },
                        child: Text(
                          "Lanjutkan",
                          style: FontFamilyConstant.primaryFont.copyWith(
                            color: ColorConstant.whiteColor,
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

  Widget _headerInputField(String label, {bool isMandatory = false}) {
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
      builder:
          (context) => AlertDialog(
            title: Column(
              children: [
                Icon(Icons.warning, color: ColorConstant.yellowColor, size: 50),
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
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .redColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Tidak',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        RegisterRequestDto registerRequestDto =
                            RegisterRequestDto(
                              name: widget.nameController.text,
                              email: widget.emailController.text,
                              phone: widget.phoneController.text,
                              password: widget.passwordController.text,
                              passwordConfirm:
                                  widget.confirmationPasswordController.text,
                            );

                        context.read<SignUpCubit>().register(
                          registerRequestDto,
                        );
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .blueColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Iya',
                        style: TextStyle(color: ColorConstant.whiteColor),
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
