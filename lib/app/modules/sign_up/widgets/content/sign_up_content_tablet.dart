import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class SignUpContentTablet extends StatefulWidget {
  const SignUpContentTablet({
    super.key,
    required this.size,
    required this.emailController,
    required this.nameController,
    required this.phoneController,
  });
  final Size size;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  @override
  State<SignUpContentTablet> createState() => _SignUpContentTabletState();
}

class _SignUpContentTabletState extends State<SignUpContentTablet> {
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
                  )
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
              _headerInputField(
                "Nama Lengkap",
                isMandatory: true,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: widget.nameController,
                hint: "Masukan Nama Lengkap",
                cursorColor: ColorConstant.blueColor,
                keyboardType: TextInputType.text,
                hintStyle: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.greyColor15,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField(
                "Email",
                isMandatory: true,
              ),
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
              _headerInputField(
                "No. WhatsApp",
              ),
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
                          if (widget.nameController.text.isEmpty || widget.emailController.text.isEmpty) {
                            snackbarError(
                              title: 'Perhatian',
                              message: 'Mohon isi semua data wajib',
                              context: context,
                            );
                          } else if (widget.nameController.text.length > 50) {
                            snackbarError(
                              title: 'Perhatian',
                              message: 'Nama tidak boleh melebihi dari 50 huruf',
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
              const SizedBox(height: 15),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4.0, // Ruang antar kata
                children: [
                  Text(
                    "Dengan mendaftar, Anda menyetujui",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Kebijakan Privasi",
                      style: FontFamilyConstant.primaryFont.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.orangeColor2,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebviewScreen(
                            title: "Kebijakan Privasi",
                            link: AppConfig.appName,
                            fromSignUp: true,
                          ),
                        ),
                        (route) => true,
                      );
                    },
                  ),
                  Text(
                    "Serta",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Syarat dan Ketentuan",
                      style: FontFamilyConstant.primaryFont.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.orangeColor2,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebviewScreen(
                            title: "Syarat dan Ketentuan",
                            link: AppConfig.appName,
                            fromSignUp: true,
                          ),
                        ),
                        (route) => true,
                      );
                    },
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
            children: [
              Expanded(
                child: ElevatedButton(
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    RegisterRequestDto registerRequestDto = RegisterRequestDto(
                      name: widget.nameController.text,
                      email: widget.emailController.text,
                      phone: widget.phoneController.text,
                    );

                    context.read<SignUpCubit>().register(registerRequestDto);
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
