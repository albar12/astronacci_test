import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:octo_image/octo_image.dart';

import '/path.dart';

class HomeBooklistDesktopComponent extends StatelessWidget {
  const HomeBooklistDesktopComponent({
    super.key,
    required this.size,
    required this.state,
  });
  final Size size;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    // if (!state.data.hasBeenDisconnected) {
    //   if (state.data.bookModelBundle != null && state.data.bookModelBundle!.isNotEmpty) {
    //     for (var data in state.data.bookModelBundle!) {
    //       if (!state.data.bookList!.any((book) => book.id == data.bookModel?.id)) {
    //         state.data.bookList!.add(data.bookModel!);
    //       }
    //     }
    //   }
    // }
    // else {
    //   state.data.bookList!.addAll(state.data.bookModel!.toList());
    // }

    return Container();
    //  state.data.bookList == null || state.data.bookList!.isEmpty
    //     ? SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Image.asset(
    //             "assets/images/img_empty_file_ilustration.png",
    //             width: 300,
    //           ),
    //           const SizedBox(height: 10),
    //           Text(
    //             "Belum Ada Buku",
    //             style: FontFamilyConstant.primaryFont.copyWith(
    //               fontWeight: FontWeight.w800,
    //               fontSize: 18,
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //     : AlignedGridView.count(
    //       crossAxisCount: 3,
    //       mainAxisSpacing: 10,
    //       crossAxisSpacing: 15,
    //       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    //       itemCount: state.data.bookList!.reversed.length,
    //       itemBuilder: (context, index) {
    //         // Mengakses data dari index terakhir ke pertama
    //         var data = state.data.bookList!.reversed.toList()[index];
    //         var bookBundle = state.data.bookModelBundle?.firstWhere(
    //           (e) => e.bookModel!.id == data.id,
    //           orElse: () => BookModelBundle.empty(),
    //         );
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 8.0),
    //           child: _items(
    //             context,
    //             data,
    //             bookBundle?.is_free == 1
    //                 ? false
    //                 : data.isFree == 1
    //                 ? false
    //                 : true,
    //           ),
    //         );
    //       },
    //     );
  }

  // Widget _items(BuildContext context, BookModel bookModel, bool isPremium) {
  //   return InkWell(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Stack(
  //           children: [
  //             ClipRRect(
  //               borderRadius: BorderRadius.circular(8),
  //               child: OctoImage(
  //                 image:
  //                     bookModel.isDownloaded == true
  //                         ? FileImage(File(bookModel.imageDownloadPath ?? ''))
  //                         : NetworkImage(
  //                           bookModel.image_url!.isNotEmpty
  //                               ? bookModel.image_url!
  //                               : "",
  //                         ),
  //                 placeholderBuilder: (context) {
  //                   return Image.asset("assets/images/img_placeholder.png");
  //                 },
  //                 errorBuilder: (context, error, stackTrace) {
  //                   return Image.asset("assets/images/img_placeholder.png");
  //                 },
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //             Visibility(
  //               visible:
  //                   !isPremium ||
  //                           (bookModel.subscriptionPlan!.isNotEmpty &&
  //                               bookModel.subscriptionPlan![0].price == 0)
  //                       ? false
  //                       : true,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(2.0),
  //                 child: CircleAvatar(
  //                   radius: 18,
  //                   backgroundColor: ColorConstant.whiteColor,
  //                   child: SvgPicture.asset(
  //                     "assets/icons/svg/ic_star_premium.svg",
  //                     width: 23,
  //                     height: 23,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 8),
  //         Align(alignment: Alignment.centerLeft, child: _footer(bookModel)),
  //       ],
  //     ),
  //     onTap: () {
  //       if (!isPremium) {
  //         bookModel.isFree = 1;
  //       } else {
  //         bookModel.isFree = 0;
  //       }
  //       if (!isPremium ||
  //           (bookModel.subscriptionPlan!.isNotEmpty &&
  //               bookModel.subscriptionPlan![0].price == 0)) {
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder:
  //                 (context) => BookDetailScreen(
  //                   bookModel: bookModel,
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
  //   var bookModelBundle = state.data.bookModelBundle?.firstWhere(
  //     (e) => e.bookModel?.id == bookModel.id,
  //     orElse:
  //         () =>
  //             BookModelBundle.empty(), // Mengembalikan null jika tidak ada yang cocok
  //   );

  //   var timestamp = bookModel.published_at;
  //   // Konversi ke DateTime
  //   DateTime dateTime =
  //       timestamp != null
  //           ? DateTime.fromMillisecondsSinceEpoch(timestamp)
  //           : bookModelBundle!.duration_time != null &&
  //               bookModelBundle.duration_time!.isNotEmpty
  //           ? DateTime.parse(bookModelBundle.duration_time.toString())
  //           : DateTime.parse('2024-12-04T03:23:50.000Z');

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
  //           fontSize: 18,
  //         ),
  //       ),
  //       Text(
  //         bookModel.title!.toString(),
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //         style: FontFamilyConstant.primaryFont.copyWith(
  //           fontWeight: FontWeight.w800,
  //           fontSize: 16,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
