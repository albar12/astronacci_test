import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class OtpContent extends StatefulWidget {
  const OtpContent({
    super.key,
    required this.size,
    required this.username,
    required this.brand,
    required this.otpController,
    this.forgotPassword,
    this.removeAccount,
    this.deactiveAccount,
    this.fromAuth,
    this.profileModel,
  });
  final Size size;
  final String username;
  final String brand;
  final TextEditingController otpController;
  final bool? forgotPassword;
  final bool? removeAccount;
  final bool? deactiveAccount;
  final bool? fromAuth;
  final ProfileModel? profileModel;

  @override
  State<OtpContent> createState() => _OtpContentState();
}

class _OtpContentState extends State<OtpContent> {
  bool isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
      width: widget.size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
                  Image.asset("assets/images/img_text_logo.png", width: 200),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Yuk, verifikasi OTP Kamu dulu!",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: FontFamilyConstant.primaryFont.copyWith(
                        color: ColorConstant.blackColor3,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Masukkan Kode OTP yang telah dikirim ke email Kamu',
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: ColorConstant.greyColor14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "",
                        style: FontFamilyConstant.primaryFont.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: ColorConstant.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: '. Harap periksa email kamu.',
                        style: FontFamilyConstant.primaryFont.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: ColorConstant.greyColor14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _headerInputField("Kode OTP", isMandatory: true),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: widget.otpController,
                hint: "Masukan Kode OTP",
                cursorColor: ColorConstant.greyColor15,
                keyboardType: TextInputType.text,
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
                          backgroundColor: ColorConstant.greyColor9,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (widget.forgotPassword == true) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const ForgotPasswordScreen(),
                              ),
                              (route) => false,
                            );
                          } else if (widget.fromAuth == true) {
                            Navigator.pushNamedAndRemoveUntil(
                              // ignore: use_build_context_synchronously
                              context,
                              '/auth',
                              (route) => false,
                            );
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/sign-up',
                              (route) => false,
                            );
                          }
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
                          if (widget.otpController.text.isNotEmpty) {
                            var otpBloc = context.read<OtpCubit>();
                            // deviceId: $deviceId
                            customInfoLog("""
                          username: ${widget.username}
                            brand: ${AppConfig.brand}
                            """);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        const ForgotPasswordFormScreen(),
                              ),
                              (route) => true,
                            );
                          } else {
                            snackbarError(
                              title: 'Perhatian',
                              message: 'Mohon isi semua data wajib',
                              context: context,
                            );
                          }
                        },
                        child: Text(
                          "Verikasi",
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      if (isButtonEnabled) {
                        if (widget.forgotPassword == true) {
                          context.read<OtpCubit>().requestOTPForgot(
                            widget.username,
                          );
                        } else if (widget.removeAccount == true) {
                          context.read<OtpCubit>().requestOTPRemoveAccount(
                            widget.username,
                          );
                        } else if (widget.deactiveAccount == true) {
                          context.read<OtpCubit>().requestOTPDeactiveAccount(
                            widget.username,
                          );
                        } else {
                          context.read<OtpCubit>().requestOTP(widget.username);
                        }
                      } else {
                        snackbarError(
                          message:
                              "Silahkan tunggu 1 menit untuk meminta kode OTP kembali.",
                          context: context,
                        );
                      }

                      setState(() {
                        isButtonEnabled = false;
                      });

                      // Mengaktifkan tombol kembali setelah 1 menit
                      Timer(const Duration(minutes: 1), () {
                        setState(() {
                          isButtonEnabled = true;
                        });
                      });
                    },
                    child: Text(
                      "Kirim Ulang Kode OTP",
                      style: FontFamilyConstant.primaryFont.copyWith(
                        color: ColorConstant.blueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
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

  Future<dynamic> _removeDialog(BuildContext context) async {
    var otpBloc = context.read<OtpCubit>();
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Icon(
              Icons.warning,
              color: ColorConstant.yellowColor,
              size: 50,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hapus Akun',
                  textAlign: TextAlign.center,
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Apakah Anda yakin akan menghapus akun?',
                  textAlign: TextAlign.center,
                  style: FontFamilyConstant.primaryFont.copyWith(fontSize: 14),
                ),
              ],
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
                        'Batal',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);

                        otpBloc.verifyRemoveAccount(
                          widget.username,
                          widget.otpController.text,
                        );
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

  Future<dynamic> _deactiveDialog(BuildContext context) async {
    var otpBloc = context.read<OtpCubit>();
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Icon(
              Icons.warning,
              color: ColorConstant.yellowColor,
              size: 50,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Non-Aktif Akun',
                  textAlign: TextAlign.center,
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Apakah Anda yakin akan menonaktifkan akun?',
                  textAlign: TextAlign.center,
                  style: FontFamilyConstant.primaryFont.copyWith(fontSize: 14),
                ),
              ],
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
                        'Batal',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);

                        otpBloc.verifyDeactiveAccount(
                          widget.username,
                          widget.otpController.text,
                        );
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
