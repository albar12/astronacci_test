import 'package:flutter/material.dart';

import '/path.dart';

class ProfileHeaderComponent extends StatelessWidget {
  const ProfileHeaderComponent({
    super.key,
    required this.size,
    required this.profileState,
  });

  final Size size;
  final ProfileState profileState;
  @override
  Widget build(BuildContext context) {
    String fullName = profileState.data.profileModel?.name ?? '';
    // String fullName = 'Irwanto Kogawa Datebayo Uzumaki Hutagaol';

    List<String> names = fullName.split(' ');

    // Mengambil dua nama pertama
    String firstTwoNames = names.take(2).join(' ');

    String nameUser = names.length > 2
        ? names.take(2).join(' ')
        : firstTwoNames.length > 16
            ? names.take(1).join(' ')
            : fullName;

    return Container(
      width: size.width / 0.1,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.1,
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.shade300.withOpacity(0.5),
            blurRadius: 24,
            offset: const Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 26.0,
          horizontal: 10.0,
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
            SizedBox(
              width: size.width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width / 1.5,
                  child: Text(
                    fullName,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width / 1.5,
                  child: Text(
                    profileState.data.profileModel?.email ?? "Unknown Email",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      // color: ColorConstant.greyColor1,
                    ),
                  ),
                ),
                // SvgPicture.asset("assets/icons/svg/ic_premium.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
