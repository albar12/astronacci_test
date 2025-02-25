import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '/path.dart';

class HomeBundleComponent extends StatelessWidget {
  const HomeBundleComponent({
    super.key,
    required this.size,
    required this.state,
    required this.formattedTimeZone,
  });

  final Size size;
  final HomeState state;
  final String formattedTimeZone;

  @override
  Widget build(BuildContext context) {
    return Container();

    // AlignedGridView.count(
    //   crossAxisCount: 1,
    //   mainAxisSpacing: 10,
    //   crossAxisSpacing: 10,
    //   padding: const EdgeInsets.symmetric(vertical: 8),
    //   itemCount: state.data.premiumBundle!.reversed.length,
    //   itemBuilder: (context, index) {
    //     return _items(
    //       context,
    //       state.data.premiumBundle![index].bundleModel!,
    //       state.data.premiumBundle![index],
    //     );
    //   },
    // );
  }

  // Widget _items(
  //   BuildContext context,
  //   BundleModel BundleModel,
  //   PremiumBundle premiumBundle,
  // ) {
  //   return InkWell(
  //     child: Container(
  //       // width: size.width * 0.4,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: ColorConstant.greyColor9),
  //         borderRadius: const BorderRadius.all(Radius.circular(10)),
  //         image: const DecorationImage(
  //           image: AssetImage("assets/images/img_card_bundles.png"),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       child: IntrinsicHeight(
  //         child: SingleChildScrollView(
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(
  //               vertical: 10.0,
  //               horizontal: 13.0,
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [_footer(BundleModel, premiumBundle)],
  //                 ),
  //                 SvgPicture.asset('assets/icons/svg/ic_arrow_right.svg'),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     onTap: () {
  //       var timestamp = premiumBundle.duration_time;
  //       // Konversi ke DateTime
  //       DateTime duration_time = DateTime.parse(timestamp);
  //       DateTime today = DateTime.now();
  //       String formattedDate = DateFormat('yyyy-MM-dd').format(duration_time);
  //       String formattedDateToday = DateFormat('yyyy-MM-dd').format(today);
  //       DateTime durationBook = DateTime.parse(formattedDate);
  //       DateTime todayTime = DateTime.parse(formattedDateToday);
  //       if (todayTime.millisecondsSinceEpoch >
  //           durationBook.millisecondsSinceEpoch) {
  //         _limitDuration(context);
  //       } else {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder:
  //                 (context) => BookmarksScreen(
  //                   id: BundleModel.id,
  //                   title: BundleModel.name ?? '-',
  //                   premiumBundle: premiumBundle,
  //                   hasBeenDisconnected: state.data.hasBeenDisconnected,
  //                 ),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  // Widget _footer(BundleModel BundleModel, PremiumBundle premiumBundle) {
  //   var timestamp = premiumBundle.duration_time;
  //   // Konversi ke DateTime
  //   DateTime dateTime = DateTime.parse(timestamp);
  //   DateTime today = DateTime.now();

  //   // Format tanggal
  //   String published_at = DateFormat('yyyy-MM-dd').format(dateTime);

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       SizedBox(
  //         width: size.width / 1.2,
  //         child: Text(
  //           BundleModel.name ?? '',
  //           style: FontFamilyConstant.primaryFont.copyWith(
  //             color: ColorConstant.whiteColor,
  //             fontWeight: FontWeight.bold,
  //             fontSize: 20,
  //           ),
  //         ),
  //       ),
  //       Text(
  //         "${premiumBundle.total_books} Buku",
  //         style: FontFamilyConstant.primaryFont.copyWith(
  //           color: ColorConstant.whiteColor,
  //           fontSize: 14,
  //         ),
  //       ),
  //       SizedBox(
  //         width: size.width / 1.2,
  //         child: Text(
  //           "Berlaku s/d ${DateHelper.formatDate(published_at)}",
  //           style: FontFamilyConstant.primaryFont.copyWith(
  //             color: ColorConstant.whiteColor,
  //             fontSize: 14,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Future<dynamic> _limitDuration(BuildContext context) async {
  //   return showDialog(
  //     context: context,
  //     builder:
  //         (context) => AlertDialog(
  //           title: Column(
  //             children: [
  //               Icon(
  //                 Icons.cancel_outlined,
  //                 color: ColorConstant.redColor,
  //                 size: 50,
  //               ),
  //               Text(
  //                 'Waktu durasi telah habis!',
  //                 textAlign: TextAlign.center,
  //                 style: FontFamilyConstant.primaryFont.copyWith(
  //                   fontWeight: FontWeight.w700,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           content: Text(
  //             'Silahkan tambah durasi untuk melanjutkan membaca',
  //             textAlign: TextAlign.center,
  //             style: FontFamilyConstant.primaryFont.copyWith(
  //               fontWeight: FontWeight.w700,
  //               fontSize: 14,
  //             ),
  //           ),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(false);
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor:
  //                     ColorConstant.blueColor, // Warna latar belakang tombol
  //               ),
  //               child: Text(
  //                 'Oke',
  //                 style: TextStyle(color: ColorConstant.whiteColor),
  //               ),
  //             ),
  //           ],
  //         ),
  //   );
  // }
}
