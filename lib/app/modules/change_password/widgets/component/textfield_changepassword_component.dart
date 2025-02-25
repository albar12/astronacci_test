import 'package:flutter/material.dart';

import '/path.dart';

class TextfieldChangepasswordComponent extends StatefulWidget {
  const TextfieldChangepasswordComponent({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.readOnly,
    this.obscureText,
    this.isMandatory,
  });
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool? obscureText;
  final bool? isMandatory;
  @override
  State<TextfieldChangepasswordComponent> createState() => _TextfieldChangepasswordComponentState();
}

class _TextfieldChangepasswordComponentState extends State<TextfieldChangepasswordComponent> {
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
          TextFormField(
            obscureText: widget.obscureText ?? true,
            readOnly: widget.readOnly ?? false,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
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
