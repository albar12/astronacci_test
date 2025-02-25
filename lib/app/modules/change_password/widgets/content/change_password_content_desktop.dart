import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class ChangePasswordContentDesktop extends StatefulWidget {
  const ChangePasswordContentDesktop({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  State<ChangePasswordContentDesktop> createState() => _ChangePasswordContentDesktopState();
}

class _ChangePasswordContentDesktopState extends State<ChangePasswordContentDesktop> {
  TextEditingController passwordLama = TextEditingController();
  TextEditingController passwordBaru = TextEditingController();
  TextEditingController passwordKonfirmasi = TextEditingController();

  bool obscureText = true;
  bool obscureNP = true;
  bool obscureConfP = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HeaderChangepasswordComponentDesktop(
                size: widget.size,
              ),
              TextfieldChangepasswordComponent(
                obscureText: obscureText,
                label: "Kata Sandi Lama",
                isMandatory: true,
                controller: passwordLama,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText == false ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextfieldChangepasswordComponent(
                obscureText: obscureNP,
                label: "Kata Sandi Baru",
                isMandatory: true,
                controller: passwordBaru,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureNP = !obscureNP;
                    });
                  },
                  icon: Icon(
                    obscureNP == false ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextfieldChangepasswordComponent(
                obscureText: obscureConfP,
                label: "Konfirmasi Kata Sandi Baru",
                isMandatory: true,
                controller: passwordKonfirmasi,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureConfP = !obscureConfP;
                    });
                  },
                  icon: Icon(
                    obscureConfP == false ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 50),
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
                  onPressed: () {
                    if (passwordLama.text.isEmpty || passwordBaru.text.isEmpty || passwordKonfirmasi.text.isEmpty) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Mohon isi semua data wajib',
                        context: context,
                      );
                    } else if (passwordBaru.text.length < 6 || passwordBaru.text.length > 50) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Panjang password minimal 6 dan maksimal 50 karakter',
                        context: context,
                      );
                    } else if (passwordBaru.text != passwordKonfirmasi.text) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Password dan Konfimasi Password tidak sesuai',
                        context: context,
                      );
                    } else {
                      ChangePasswordRequestDto requestDto = ChangePasswordRequestDto(
                        old_password: passwordLama.text,
                        password: passwordBaru.text,
                        password_confirmation: passwordKonfirmasi.text,
                      );
                      _backDialog(context, requestDto);
                    }
                  },
                  child: Text(
                    "Simpan Perubahan",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _backDialog(
    BuildContext context,
    ChangePasswordRequestDto requestDto,
  ) async {
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
            const Text(
              'Apa Anda Yakin?',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          'Apa Anda yakin akan ubah password?',
          textAlign: TextAlign.center,
          style: FontFamilyConstant.primaryFont.copyWith(),
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
                    'Batal',
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
                    Navigator.of(context).pop(false);
                    context.read<ChangePasswordCubit>().changePassword(requestDto);
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
