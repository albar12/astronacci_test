import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class HomeRecentComponent extends StatelessWidget {
  const HomeRecentComponent({
    super.key,
    required this.size,
    required this.state,
    required this.hasBeenDisconnected,
  });
  final Size size;
  final HomeState state;
  final bool hasBeenDisconnected;
  @override
  Widget build(BuildContext context) {
    return Container();

    //  Visibility(
    //   visible: hasBeenDisconnected || (state.data.recent == null || state.data.recent!.isEmpty) ? false : true,
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             "Recent searches",
    //             style: FontFamilyConstant.primaryFont.copyWith(
    //               fontWeight: FontWeight.w900,
    //               fontSize: 18,
    //             ),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               context.read<HomeCubit>().deleteAllRecent();
    //             },
    //             child: Row(
    //               children: [
    //                 Text(
    //                   "Clear recent searches",
    //                   style: FontFamilyConstant.primaryFont.copyWith(
    //                     color: ColorConstant.blueColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 14,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //       SizedBox(
    //         height: size.height / 90,
    //       ),
    //       Column(
    //         children: [
    //           ...List.generate(state.data.recent!.length, (index) {
    //             return Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 _items(context, state.data.recent![index]),
    //                 SizedBox(
    //                   height: size.height / 30,
    //                 ),
    //               ],
    //             );
    //           }),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  // Widget _items(BuildContext context, BookModel bookModel) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         InkWell(
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 width: 100,
  //                 height: 160,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(10),
  //                   child: FadeInImage.assetNetwork(
  //                     placeholder:
  //                         "assets/images/img_placeholder.png", // Gambar placeholder
  //                     image:
  //                         bookModel.image_url!.isNotEmpty
  //                             ? bookModel.image_url!
  //                             : "", // Gunakan string kosong jika URL tidak ada
  //                     fit: BoxFit.cover,
  //                     fadeInDuration: const Duration(
  //                       milliseconds: 200,
  //                     ), // Durasi efek fade-in
  //                     fadeOutDuration: const Duration(
  //                       milliseconds: 200,
  //                     ), // Durasi efek fade-out
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(width: 10),
  //               _footer(bookModel),
  //             ],
  //           ),
  //           onTap: () {
  //             if (bookModel.subscriptionPlan!.isNotEmpty &&
  //                 bookModel.subscriptionPlan![0].price == 0) {
  //               Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder:
  //                       (context) => BookDetailScreen(
  //                         bookModel: bookModel,
  //                         hasBeenDisconnected: state.data.hasBeenDisconnected,
  //                         isFree: true,
  //                       ),
  //                 ),
  //                 (route) => false,
  //               );
  //             } else {
  //               Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder:
  //                       (context) => BookDetailScreen(
  //                         bookModel: bookModel,
  //                         hasBeenDisconnected: state.data.hasBeenDisconnected,
  //                       ),
  //                 ),
  //                 (route) => false,
  //               );
  //             }
  //           },
  //         ),
  //         IconButton(
  //           onPressed: () {
  //             context.read<HomeCubit>().deleteRecent(bookModel);
  //           },
  //           icon: const Icon(Icons.close),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _footer(BookModel bookModel) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           width: size.width / 2.1,
  //           child: Text(
  //             bookModel.title!.length <= 50
  //                 ? bookModel.title.toString()
  //                 : "${bookModel.title.toString().substring(0, 50)}...",
  //             style: FontFamilyConstant.primaryFont.copyWith(
  //               fontWeight: FontWeight.w800,
  //               fontSize: 18,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: size.width / 2.1,
  //           child: Text(
  //             bookModel.bookWriter!.isNotEmpty
  //                 ? bookModel.bookWriter!.map((e) => e.name).join(',').length <=
  //                         30
  //                     ? bookModel.bookWriter!.map((e) => e.name).join(',')
  //                     : "${bookModel.bookWriter!.map((e) => e.name).join(',').substring(0, 30)}..."
  //                 : "Unknown Writer",
  //             style: FontFamilyConstant.primaryFont.copyWith(
  //               color: ColorConstant.primaryColor,
  //               fontSize: 14,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
