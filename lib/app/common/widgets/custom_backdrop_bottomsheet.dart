import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/path.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum CustomBackdropBottomsheetType {
  customLayout, //digunakan untuk custom layout pada bottom sheet
  generalLoading, //digunakan untuk bottom sheet yang memuat content loading
  confirmationLayout, // digunakan untuk layout konfirmasi
  logoutLayout, // digunakan untuk layout logout
}

class CustomBackdropBottomsheet extends StatelessWidget {
  const CustomBackdropBottomsheet({
    super.key,
    this.child,
    this.title = '',
    this.subtitle = '',
    this.customIcon = 'assets/icons/svg/image_leave_request.svg',
    this.confirmationButton = 'OK',
    this.onConfirmationPressed,
    required this.typeBottomSheet,
  });

  // other variable
  final Widget? child;
  final VoidCallback? onConfirmationPressed;
  final CustomBackdropBottomsheetType typeBottomSheet;

  // variable string
  final String title;
  final String subtitle;
  final String customIcon;
  final String confirmationButton;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Wrap(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(24),
            ),
            child: _layout(
              context: context,
              type: typeBottomSheet,
            ),
          ),
        ),
      ],
    );
  }

  Widget _layout({
    required BuildContext context,
    required CustomBackdropBottomsheetType type,
  }) {
    switch (type) {
      // case for custom layout
      case CustomBackdropBottomsheetType.customLayout:
        return child!;

      // case for general loading
      case CustomBackdropBottomsheetType.generalLoading:
        return _generalLoadingBottomSheet(context: context);

      // case for confirmation layout
      case CustomBackdropBottomsheetType.confirmationLayout:
        return _confirmationLayout(context: context);

      case CustomBackdropBottomsheetType.logoutLayout:
        return _logoutLayout(context: context);

      // default
      // ignore: unreachable_switch_default
      default:
        return _generalLoadingBottomSheet(context: context);
    }
  }

  Widget _generalLoadingBottomSheet({
    required BuildContext context,
  }) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          title,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        LoadingAnimationWidget.twoRotatingArc(
          color: ColorConstant.primaryColor,
          size: 64,
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _confirmationLayout({
    required BuildContext context,
  }) {
    return Column(
      children: [
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.close,
              color: ColorConstant.greyColor9,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 4),
        SvgPicture.asset(customIcon),
        const SizedBox(height: 24),
        Text(
          title,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.greyColor10,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.greyColor11,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(
                    color: ColorConstant.greyColor12,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  backgroundColor: ColorConstant.whiteColor,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    color: ColorConstant.greyColor10,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: ColorConstant.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: onConfirmationPressed,
                child: Text(
                  confirmationButton,
                  style: FontFamilyConstant.primaryFont.copyWith(
                    color: ColorConstant.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _logoutLayout({
    required BuildContext context,
  }) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Image.asset(customIcon),
        const SizedBox(height: 24),
        Text(
          title,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.greyColor10,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.greyColor11,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: ColorConstant.whiteColor,
            side: BorderSide(color: ColorConstant.primaryColor),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: onConfirmationPressed,
          child: Text(
            confirmationButton,
            style: FontFamilyConstant.primaryFont.copyWith(
              color: ColorConstant.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
