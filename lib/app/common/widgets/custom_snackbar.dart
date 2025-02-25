import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/path.dart';

snackbarError({
  String? title,
  required String message,
  required BuildContext context,
}) {
  Flushbar(
    message: message.tr(),
    titleText: Text(
      title ?? 'Error'.tr(),
      style: FontFamilyConstant.primaryFont.copyWith(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      message.tr(),
      style: FontFamilyConstant.primaryFont.copyWith(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: ColorConstant.redColor,
    duration: const Duration(seconds: 2),
    animationDuration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    icon: Icon(
      Icons.error,
      color: ColorConstant.whiteColor,
    ),
    borderRadius: BorderRadius.circular(8),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
  ).show(context);
}

snackbarSuccess({
  String? title,
  required String message,
  required BuildContext context,
  Color? backgroundColor,
}) {
  Flushbar(
    message: message.tr(),
    titleText: Text(
      title ?? 'Success'.tr(),
      style: FontFamilyConstant.primaryFont.copyWith(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      message,
      style: FontFamilyConstant.primaryFont.copyWith(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: backgroundColor ?? ColorConstant.greenColor,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    icon: Icon(
      Icons.check,
      color: ColorConstant.whiteColor,
    ),
    borderRadius: BorderRadius.circular(8),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
  ).show(context);
}

snackbarWarning({
  String? title,
  required String message,
  required BuildContext context,
}) {
  Flushbar(
    message: message.tr(),
    titleText: Text(
      title ?? 'Warning'.tr(),
      style: FontFamilyConstant.primaryFont.copyWith(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      message.tr(),
      style: FontFamilyConstant.primaryFont.copyWith(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: ColorConstant.blackColor,
    duration: const Duration(seconds: 2),
    animationDuration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    icon: Icon(
      Icons.error,
      color: ColorConstant.whiteColor,
    ),
    borderRadius: BorderRadius.circular(8),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
  ).show(context);
}

snackbarCatatan({
  String? title,
  required String message,
  required BuildContext context,
  required Function(bool isClosed) onDismissedCallback,
}) {
  // Membuat objek Flushbar
  late Flushbar flushbar;
  flushbar = Flushbar(
    message: message.tr(),
    messageText: Text(
      message.tr(),
      style: FontFamilyConstant.primaryFont.copyWith(
        fontSize: 14,
        color: ColorConstant.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: ColorConstant.blackColor,
    // mainButton: IconButton(
    //   onPressed: () {
    //     // Menutup Flushbar saat tombol close ditekan
    //     flushbar.dismiss();
    //   },
    //   icon: Icon(
    //     Icons.close,
    //     color: ColorConstant.whiteColor,
    //   ),
    // ),
    animationDuration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    borderRadius: BorderRadius.circular(8),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    onStatusChanged: (status) {
      if (status == FlushbarStatus.DISMISSED) {
        // Mengirimkan status 'closed' saat Flushbar ditutup
        onDismissedCallback(true); // Flushbar sudah ditutup
      }
    },
  );

  // Menampilkan Flushbar
  flushbar.show(context);
}
