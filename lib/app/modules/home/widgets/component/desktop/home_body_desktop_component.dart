import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import '/path.dart';

class HomeBodyDesktopComponent extends StatelessWidget {
  const HomeBodyDesktopComponent({
    super.key,
    required this.size,
    required this.state,
  });
  final Size size;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Container();
    //  Padding(
    //   padding: const EdgeInsets.symmetric(
    //     vertical: 8.0,
    //     horizontal: 5.0,
    //   ),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: ColorConstant.whiteColor,
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: [
    //         BoxShadow(
    //           // ignore: deprecated_member_use
    //           color: Colors.grey.shade300.withOpacity(0.5),
    //           blurRadius: 24,
    //           offset: const Offset(2, 2), // changes position of shadow
    //         ),
    //       ],
    //     ),
    //     child: bookLastRead(context, state),
    //   ),
    // );
  }

  // Widget bookLastRead(BuildContext context, HomeState state) {
  //   return InkWell(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         const SizedBox(width: 18),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Container(
  //             width: 140,
  //             height: 200,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(5),
  //               boxShadow: [
  //                 BoxShadow(
  //                   // ignore: deprecated_member_use
  //                   color: Colors.black.withOpacity(0.015),
  //                   blurRadius: 50,
  //                   offset: const Offset(0, 0), // changes position of shadow
  //                 ),
  //               ],
  //             ),
  //             child: Stack(
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(8),
  //                   child: OctoImage(
  //                     image: FileImage(
  //                       File(state.data.lastRead?.imageDownloadPath ?? ''),
  //                     ),
  //                     placeholderBuilder: (context) {
  //                       return Image.asset("assets/images/img_placeholder.png");
  //                     },
  //                     errorBuilder: (context, error, stackTrace) {
  //                       return Image.asset("assets/images/img_placeholder.png");
  //                     },
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 Visibility(
  //                   visible: state.data.lastRead?.isFree != 1,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(2.0),
  //                     child: CircleAvatar(
  //                       radius: 13,
  //                       backgroundColor: ColorConstant.whiteColor,
  //                       child: SvgPicture.asset(
  //                         "assets/icons/svg/ic_star_premium.svg",
  //                         width: 18,
  //                         height: 18,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 18),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(
  //               width: size.width / 2.2,
  //               child: Text(
  //                 "Lanjutkan membaca",
  //                 style: FontFamilyConstant.primaryFont.copyWith(
  //                   fontSize: 20,
  //                   color: ColorConstant.primaryColor,
  //                   fontWeight: FontWeight.w700,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             SizedBox(
  //               width: size.width / 2.1,
  //               child: Text(
  //                 state.data.lastRead!.title.toString(),
  //                 maxLines: 3,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: FontFamilyConstant.primaryFont.copyWith(
  //                   fontSize: 20,
  //                   color: ColorConstant.blackColor,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               width: size.width / 2.1,
  //               child: Text(
  //                 state.data.lastRead!.bookWriter!.isNotEmpty
  //                     ? state.data.lastRead!.bookWriter!
  //                                 .map((e) => e.name)
  //                                 .join(',')
  //                                 .length <=
  //                             120
  //                         ? state.data.lastRead!.bookWriter!
  //                             .map((e) => e.name)
  //                             .join(',')
  //                         : "${state.data.lastRead!.bookWriter!.map((e) => e.name).join(',').substring(0, 120)}..."
  //                     : "Unknown Writer",
  //                 style: FontFamilyConstant.primaryFont.copyWith(
  //                   fontSize: 20,
  //                   color: Colors.grey[600],
  //                   fontWeight: FontWeight.w700,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //     onTap: () {
  //       // if (state.data.lastRead!.until_duration == 0 || state.data.lastRead!.until_duration == null) {
  //       if (state.data.lastRead?.isFree == 1) {
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder:
  //                 (context) => BookDetailScreen(
  //                   bookModel: state.data.lastRead!,
  //                   hasBeenDisconnected: state.data.hasBeenDisconnected,
  //                   isFree: true,
  //                 ),
  //           ),
  //           (route) => false,
  //         );
  //       } else {
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder:
  //                 (context) => BookDetailScreen(
  //                   bookModel: state.data.lastRead!,
  //                   hasBeenDisconnected: state.data.hasBeenDisconnected,
  //                 ),
  //           ),
  //           (route) => false,
  //         );
  //       }
  //     },
  //   );
  // }

  // Widget bookLastReadNull(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: ColorConstant.primaryColor,
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               width: 150,
  //               height: 120,
  //               decoration: const BoxDecoration(
  //                 image: DecorationImage(
  //                   image: AssetImage("assets/images/img_home_ilustration.png"),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 10),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   width: size.width / 1.8,
  //                   child: Text(
  //                     "Temukan, baca, dan jelajahi dunia baru di setiap halaman!",
  //                     style: FontFamilyConstant.primaryFont.copyWith(
  //                       fontSize: 20,
  //                       color: ColorConstant.blackColor,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   child: ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: ColorConstant.blueColor,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                     ),
  //                     onPressed: () {
  //                       context.read<BottomNavbarCubit>().changeIndex(1);
  //                     },
  //                     child: Text(
  //                       "Mulai Baca",
  //                       style: FontFamilyConstant.primaryFont.copyWith(
  //                         fontSize: 20,
  //                         color: ColorConstant.whiteColor,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
