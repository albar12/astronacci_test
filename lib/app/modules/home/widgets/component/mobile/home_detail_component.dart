import 'package:flutter/material.dart';

import '/path.dart';

// ignore: must_be_immutable
class HomeDetailComponent extends StatelessWidget {
  HomeDetailComponent({
    super.key,
    required this.size,
    required this.state,
    required this.user,
  });
  final Size size;
  final HomeState state;
  final User user;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _headerInputField("Nama Lengkap"),
            const SizedBox(height: 8),
            CustomTextFormField(
              isReadOnly: true,
              controller: controller,
              hint: user.nama,
              cursorColor: ColorConstant.greyColor15,
              keyboardType: TextInputType.text,
              hintStyle: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _headerInputField("Email"),
            const SizedBox(height: 8),
            CustomTextFormField(
              isReadOnly: true,
              controller: controller,
              hint: user.email,
              cursorColor: ColorConstant.blueColor,
              keyboardType: TextInputType.emailAddress,
              hintStyle: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _headerInputField("No. WhatsApp"),
            const SizedBox(height: 8),
            CustomTextFormField(
              isReadOnly: true,
              controller: controller,
              hint: user.noWhatsapp,
              cursorColor: ColorConstant.blueColor,
              keyboardType: TextInputType.phone,
              hintStyle: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _headerInputField("Status"),
            const SizedBox(height: 8),
            CustomTextFormField(
              isReadOnly: true,
              controller: controller,
              hint: user.isActive ? 'Aktif' : "Non-Aktif",
              cursorColor: ColorConstant.blueColor,
              keyboardType: TextInputType.phone,
              hintStyle: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _headerInputField(String label, {bool isMandatory = false}) {
    return Row(
      children: [
        Text(
          label,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.blackColor3,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        if (isMandatory)
          Text(
            "*",
            style: FontFamilyConstant.primaryFont.copyWith(
              color: ColorConstant.redColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
