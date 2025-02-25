import 'package:flutter/material.dart';
import '/path.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.prefixIcon,
    required this.hintStyle,
    this.labelStyle,
    this.useLabel = true,
    this.suffixIcon,
    this.cursorColor,
    this.obscureText,
    this.keyboardType,
    this.isReadOnly,
  });

  final bool? useLabel;
  final String hint;
  final TextStyle? labelStyle;
  final TextStyle hintStyle;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? cursorColor;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      readOnly: isReadOnly ?? false,
      controller: controller,
      obscureText: obscureText ?? false,
      cursorColor: cursorColor ?? ColorConstant.blackColor,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        fillColor: isReadOnly == true ? ColorConstant.greyColor17 : ColorConstant.whiteColor,
        filled: isReadOnly ?? false,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gapPadding: 8,
          borderSide: BorderSide(
            color: ColorConstant.greyColor9,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ColorConstant.primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
