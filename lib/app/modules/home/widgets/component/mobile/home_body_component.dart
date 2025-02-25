import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import '/path.dart';

class HomeBodyComponent extends StatelessWidget {
  const HomeBodyComponent({super.key, required this.size, required this.state});
  final Size size;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(10),
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: bookLastRead(context, state),
        ),
      ),
    );
  }

  Widget bookLastRead(BuildContext context, HomeState state) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width / 3,
              height: size.height / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.015),
                    blurRadius: 50,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: OctoImage(
                      image: FileImage(File('')),
                      placeholderBuilder: (context) {
                        return Image.asset("assets/images/img_placeholder.png");
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/images/img_placeholder.png");
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width / 2.2,
                  child: Text(
                    "Lanjutkan membaca",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontSize: 18,
                      color: ColorConstant.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width / 2.6,
                  child: Text(
                    'state.data.lastRead!.title.toString()',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontSize: 18,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width / 2.5,
                  child: Text(
                    "Unknown Writer",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        // if (state.data.lastRead!.until_duration == 0 || state.data.lastRead!.until_duration == null) {

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder:
                (context) => BookDetailScreen(
                  hasBeenDisconnected: state.data.hasBeenDisconnected,
                ),
          ),
          (route) => false,
        );
      },
    );
  }

  Widget bookLastReadNull(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.greyColor8,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/img_home_ilustration.png"),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    "Temukan, baca, dan \njelajahi dunia baru\ndi setiap halaman!",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontSize: 14,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      context.read<BottomNavbarCubit>().changeIndex(1);
                    },
                    child: Text(
                      "Mulai Baca",
                      style: FontFamilyConstant.primaryFont.copyWith(
                        fontSize: 14,
                        color: ColorConstant.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
