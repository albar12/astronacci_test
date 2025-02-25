import 'package:flutter/material.dart';

import '/path.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    super.key,
    required this.size,
    this.profileModel,
  });
  final Size size;
  final ProfileModel? profileModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 26.0,
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            child: Image.asset(
              "assets/images/img_app_logo.png",
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(width: size.width * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width / 1.5,
                child: Text(
                  profileModel?.name ?? "Nama tidak diketahui",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 1.5,
                child: Text(
                  profileModel?.email ?? "Email tidak diketahui",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
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
