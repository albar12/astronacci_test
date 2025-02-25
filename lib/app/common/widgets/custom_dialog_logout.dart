import 'package:flutter/material.dart';
import '/path.dart';

void customDialogLogout({
  required BuildContext context,
  required Function() onLogout,
  String errorSubtitle = "Akun terdeteksi login di perangkat lain, silahkan login ulang untuk melanjutkan di perangkat ini.",
}) {
  final orientation = MediaQuery.of(context).orientation;
  final sizeWidth = MediaQuery.of(context).size.width;
  if (orientation == Orientation.portrait && sizeWidth <= 600) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // ignore: deprecated_member_use
      barrierColor: ColorConstant.blackColor.withOpacity(0.15),
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: CustomBackdropBottomsheet(
            typeBottomSheet: CustomBackdropBottomsheetType.logoutLayout,
            title: "Akun Anda Telah Keluar",
            subtitle: errorSubtitle,
            confirmationButton: "Login Kembali",
            customIcon: "assets/images/img_ilustration_logout.png",
            onConfirmationPressed: onLogout,
          ),
        );
      },
    );
  } else {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(
              "Akun Anda Telah Keluar",
              style: FontFamilyConstant.primaryFont.copyWith(
                color: ColorConstant.blackColor,
              ),
            ),
            content: Text(
              errorSubtitle,
              style: FontFamilyConstant.primaryFont.copyWith(
                color: ColorConstant.blackColor,
              ),
            ),
            backgroundColor: ColorConstant.whiteColor,
            actions: [
              TextButton(
                onPressed: onLogout,
                child: Text(
                  "OK",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    color: ColorConstant.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
