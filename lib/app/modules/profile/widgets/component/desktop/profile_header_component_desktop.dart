import 'package:flutter/material.dart';

import '/path.dart';

class ProfileHeaderComponentDesktop extends StatelessWidget {
  const ProfileHeaderComponentDesktop({
    super.key,
    required this.size,
    required this.profileState,
  });
  final Size size;
  final ProfileState profileState;
  @override
  Widget build(BuildContext context) {
    String fullName = profileState.data.profileModel?.name ?? '';
    // String fullName = 'Irwanto Kogawa Datebayo Uzumaki Hutagaol Uzumaki Hutagaol Uzumaki Hutagaol';

    List<String> names = fullName.split(' ');

    // Mengambil dua nama pertama
    String firstTwoNames = names.take(2).join(' ');

    String nameUser = names.length > 2
        ? names.take(2).join(' ')
        : firstTwoNames.length > 16
            ? names.take(1).join(' ')
            : fullName;

    return Container(
      width: size.width * 0.9,
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
        padding: const EdgeInsets.all(26.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset(
                "assets/images/img_app_logo.png",
                width: 60,
                height: 60,
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
                    maxLines: 2,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  profileState.data.profileModel?.email ?? "Email tidak diketahui",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    // color: ColorConstant.greyColor1,
                  ),
                ),
                // SvgPicture.asset(
                //   "assets/icons/svg/ic_premium.svg",
                //   width: 100,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
