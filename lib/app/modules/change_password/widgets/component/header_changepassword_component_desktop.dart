import 'package:flutter/material.dart';

import '/path.dart';

class HeaderChangepasswordComponentDesktop extends StatelessWidget {
  const HeaderChangepasswordComponentDesktop({
    super.key,
    required this.size,
  });
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Text(
        "Membuat kata sandi membantu Anda menjaga\nkeamanan akun",
        textAlign: TextAlign.center,
        style: FontFamilyConstant.primaryFont.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: ColorConstant.blackColor,
        ),
      ),
    );
  }
}
