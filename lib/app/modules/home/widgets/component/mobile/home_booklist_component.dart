import 'package:flutter/material.dart';

import '/path.dart';

class HomeBooklistComponent extends StatelessWidget {
  const HomeBooklistComponent({
    super.key,
    required this.size,
    required this.state,
  });
  final Size size;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // Widget _items(
  //   BuildContext context,
  //   BookModel bookModel,
  //   int index,
  //   bool isPremium,
  // ) {
  //   return InkWell(
  //     child: Column(
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
  //                   radius: 15,
  //                   backgroundColor: ColorConstant.whiteColor,
  //                   child: SvgPicture.asset(
  //                     "assets/icons/svg/ic_star_premium.svg",
  //                     width: 20,
  //                     height: 20,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 8),
  //         _footer(bookModel, index),
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

  // Widget _footer(BookModel bookModel, int index) {
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
  //           fontSize: 12,
  //         ),
  //       ),
  //       Text(
  //         bookModel.title!.toString(),
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //         style: FontFamilyConstant.primaryFont.copyWith(
  //           fontWeight: FontWeight.w400,
  //           fontSize: 12,
  //           color: ColorConstant.blackColor3,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
