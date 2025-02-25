import 'package:flutter/material.dart';

import '/path.dart';

class TextfieldComponent extends StatefulWidget {
  const TextfieldComponent({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.readOnly,
    this.isMandatory,
    this.hintText,
  });
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool? isMandatory;
  final String? hintText;

  @override
  State<TextfieldComponent> createState() => _TextfieldComponentState();
}

class _TextfieldComponentState extends State<TextfieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerInputField(
            widget.label,
            isMandatory: widget.isMandatory ?? false,
          ),
          const SizedBox(height: 10),
          TextFormField(
            readOnly: widget.readOnly ?? false,
            controller: widget.controller,
            // maxLines: 3,
            // minLines: 1,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              fillColor: widget.readOnly == true ? ColorConstant.greyColor17 : ColorConstant.whiteColor,
              filled: widget.readOnly ?? false,
              hintText: widget.hintText,
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
          ),
        ],
      ),
    );
  }

  Widget _headerInputField(
    String label, {
    bool isMandatory = false,
  }) {
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
