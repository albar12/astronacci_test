import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '/path.dart';

class BodyBookDetailComponent extends StatefulWidget {
  const BodyBookDetailComponent({
    super.key,
    required this.size,
    required this.state,
    this.isFree,
    required this.formattedTimeZone,
  });
  final Size size;
  final BookDetailState state;
  final bool? isFree;
  final String formattedTimeZone;

  @override
  State<BodyBookDetailComponent> createState() =>
      _BodyBookDetailComponentState();
}

class _BodyBookDetailComponentState extends State<BodyBookDetailComponent> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(0);

    // Format tanggal
    String until_duration = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "widget.bookModel.title.toString()",
            maxLines: 5,
            style: FontFamilyConstant.primaryFont.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: widget.isFree == true ? 0 : 18),
          Visibility(
            visible: widget.isFree == true ? false : true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Berlaku s/d",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                widget.state.data.checkingDuration
                    ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(),
                    )
                    : Text(
                      "${DateHelper.formatDateWithTime(until_duration)} ${widget.formattedTimeZone}",
                      style: FontFamilyConstant.primaryFont.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
              ],
            ),
          ),
          const Divider(thickness: 0.5),
          const SizedBox(height: 18),
          Text(
            "Detail",
            style: FontFamilyConstant.primaryFont.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bahasa",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  Text('-', style: FontFamilyConstant.primaryFont.copyWith()),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ISBN",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  Text('-', style: FontFamilyConstant.primaryFont.copyWith()),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tahun Terbit",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  tahunTerbit(),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Halaman",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'widget.bookModel.total_page.toString()',
                    style: FontFamilyConstant.primaryFont.copyWith(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Format",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.blackColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('-', style: FontFamilyConstant.primaryFont.copyWith()),
                ],
              ),
            ],
          ),
          const Divider(thickness: 0.5),
          const SizedBox(height: 18),
          Text(
            "Deskripsi",
            style: FontFamilyConstant.primaryFont.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            'widget.bookModel.description.toString()',
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Selengkapnya',
            trimExpandedText: ' Sembunyikan',
            style: FontFamilyConstant.primaryFont.copyWith(),
            moreStyle: FontFamilyConstant.primaryFont.copyWith(
              color: Colors.blue,
            ),
            lessStyle: FontFamilyConstant.primaryFont.copyWith(
              color: Colors.blue,
            ),
            colorClickableText: Colors.blue, // Warna teks yang bisa diklik
            textAlign: TextAlign.justify, // Penataan teks
          ),
          const Divider(thickness: 0.5),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _items() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.blackColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/svg/ic_clock.svg"),
              const SizedBox(width: 10),
              Text(
                "200 Min",
                style: FontFamilyConstant.primaryFont.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          VerticalDivider(color: ColorConstant.greyColor9),
          Row(
            children: [
              const Icon(Icons.lightbulb_outline),
              const SizedBox(width: 10),
              Text(
                "200 Soal",
                style: FontFamilyConstant.primaryFont.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tahunTerbit() {
    return Text('-', style: FontFamilyConstant.primaryFont.copyWith());
  }
}
