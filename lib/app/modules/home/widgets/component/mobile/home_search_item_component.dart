import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:octo_image/octo_image.dart';

import '/path.dart';

class HomeSearchItemComponent extends StatelessWidget {
  const HomeSearchItemComponent({
    super.key,
    required this.size,
    required this.state,
    required this.hasBeenDisconnected,
    required this.isDesktop,
  });

  final Size size;
  final HomeState state;
  final bool hasBeenDisconnected;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Container();
    // state.data.isLoading
    //     ? Center(
    //         child: LoadingAnimationWidget.staggeredDotsWave(
    //           color: ColorConstant.primaryColor,
    //           size: 32,
    //         ),
    //       )
    //     : state.data.search!.isEmpty
    //         ? SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 Image.asset(
    //                   "assets/images/img_empty_file_ilustration.png",
    //                   width: 300,
    //                 ),
    //                 const SizedBox(height: 10),
    //                 Text(
    //                   "Buku tidak ditemukan",
    //                   style: FontFamilyConstant.primaryFont.copyWith(
    //                     fontWeight: FontWeight.w800,
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )
    //         : AlignedGridView.count(
    //             crossAxisCount: isDesktop ? 3 : 2,
    //             mainAxisSpacing: 10,
    //             crossAxisSpacing: 10,
    //             padding: const EdgeInsets.symmetric(
    //               vertical: 8,
    //               horizontal: 8,
    //             ),
    //             itemCount: state.data.search?.length,
    //             itemBuilder: (context, index) {
    //               return _items(
    //                 context,
    //                 state.data.search![index],
    //                 (state.data.search![index].subscriptionPlan!.isNotEmpty && state.data.search![index].subscriptionPlan![0].price == 0)
    //                     ? false
    //                     : state.data.search![index].isFree == 1
    //                         ? false
    //                         : true,
    //               );
    //             },
    //           );
  }

  // Widget _items(BuildContext context, BookModel bookModel, bool isPremium) {
  //   return InkWell(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Stack(
  //             children: [
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(8),
  //                 child: OctoImage(
  //                   image:
  //                       state.data.hasBeenDisconnected
  //                           ? FileImage(File(bookModel.imageDownloadPath ?? ''))
  //                           : NetworkImage(
  //                             bookModel.image_url!.isNotEmpty
  //                                 ? bookModel.image_url!
  //                                 : "",
  //                           ),
  //                   placeholderBuilder: (context) {
  //                     return Image.asset("assets/images/img_placeholder.png");
  //                   },
  //                   errorBuilder: (context, error, stackTrace) {
  //                     return Image.asset("assets/images/img_placeholder.png");
  //                   },
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               Visibility(
  //                 visible:
  //                     !isPremium ||
  //                             (bookModel.subscriptionPlan!.isNotEmpty &&
  //                                 bookModel.subscriptionPlan![0].price == 0)
  //                         ? false
  //                         : true,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(2.0),
  //                   child: CircleAvatar(
  //                     radius: 15,
  //                     backgroundColor: ColorConstant.whiteColor,
  //                     child: SvgPicture.asset(
  //                       "assets/icons/svg/ic_star_premium.svg",
  //                       width: 20,
  //                       height: 20,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 8),
  //           _footer(bookModel),
  //         ],
  //       ),
  //     ),
  //     onTap: () {
  //       context.read<HomeCubit>().updateRecent(bookModel);
  //       if (!isPremium ||
  //           (bookModel.subscriptionPlan!.isNotEmpty &&
  //               bookModel.subscriptionPlan![0].price == 0)) {
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder:
  //                 (context) => BookDetailScreen(
  //                   bookModel: bookModel,
  //                   isFree: true,
  //                   hasBeenDisconnected: state.data.hasBeenDisconnected,
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
  //                   bookModel: bookModel,
  //                   hasBeenDisconnected: state.data.hasBeenDisconnected,
  //                 ),
  //           ),
  //           (route) => false,
  //         );
  //       }
  //     },
  //   );
  // }

  // Widget _footer(BookModel bookModel) {
  //   var timestamp = bookModel.published_at;
  //   // Konversi ke DateTime
  //   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp ?? 0);

  //   // Format tanggal
  //   String published_at = DateFormat('yyyy-MM-dd').format(dateTime);

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         bookModel.bookWriter!.isNotEmpty
  //             ? bookModel.bookWriter!.map((e) => e.name).join(',').length <= 30
  //                 ? bookModel.bookWriter!.map((e) => e.name).join(',')
  //                 : "${bookModel.bookWriter!.map((e) => e.name).join(',').substring(0, 30)}..."
  //             : "Unknown Writer",
  //         maxLines: 1,
  //         overflow: TextOverflow.ellipsis,
  //         style: FontFamilyConstant.primaryFont.copyWith(
  //           color: ColorConstant.primaryColor,
  //           fontSize: 12,
  //         ),
  //       ),
  //       Text(
  //         bookModel.title.toString(),
  //         maxLines: 3,
  //         style: FontFamilyConstant.primaryFont.copyWith(
  //           fontWeight: FontWeight.w800,
  //           fontSize: 13,
  //           color: ColorConstant.blackColor3,
  //         ),
  //       ),
  //       // Text(
  //       //   bookModel.published_at != null ? "Rilis ${DateHelper.formatDate(published_at)}" : "Berlaku s/d ${DateHelper.formatDate(published_at)}",
  //       //   style: FontFamilyConstant.primaryFont.copyWith(
  //       //     color: ColorConstant.blackColor,
  //       //     fontSize: 11,
  //       //   ),
  //       // ),
  //     ],
  //   );
  // }
}
