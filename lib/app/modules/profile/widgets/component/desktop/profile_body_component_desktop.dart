import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/path.dart';

class ProfileBodyComponentDesktop extends StatelessWidget {
  const ProfileBodyComponentDesktop({
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
            width: 45,
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Text(
            title,
            style: FontFamilyConstant.primaryFont.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const Spacer(),
          suffixIcon,
        ],
      ),
    );
  }
}
