import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/path.dart';

class ProfileBodyComponent extends StatelessWidget {
  const ProfileBodyComponent({
    super.key,
    required this.size,
    required this.leadingIcon,
    required this.title,
    required this.suffixIcon,
    required this.onTap,
  });

  final Size size;
  final String leadingIcon;
  final String title;
  final Widget suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            leadingIcon,
            width: size.width * 0.06,
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Text(
            title,
            style: FontFamilyConstant.primaryFont.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          suffixIcon,
        ],
      ),
    );
  }
}
