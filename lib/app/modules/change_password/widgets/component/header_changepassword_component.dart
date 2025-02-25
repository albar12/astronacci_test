import 'package:flutter/material.dart';

import '/path.dart';

class HeaderChangepasswordComponent extends StatelessWidget {
  const HeaderChangepasswordComponent({
    super.key,
    required this.size,
  });
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Text(
        "Membuat kata sandi membantu Anda menjaga keamanan akun",
        textAlign: TextAlign.center,
        style: FontFamilyConstant.primaryFont.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 15,
          color: ColorConstant.blackColor,
        ),
      ),
    );
  }
}
