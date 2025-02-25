import 'package:bounce/bounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/path.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.labelStyle,
    this.isLoading = false,
    this.withIcon = false,
    this.height = 50,
    this.elevation = 0.5,
    this.icon,
    this.backgroundColor,
    this.radius = 24,
    this.withoutCustomSize = false,
  });

  final String label;
  final TextStyle labelStyle;
  final void Function()? onPressed;
  final bool isLoading;
  final bool withIcon;
  final double height;
  final Widget? icon;
  final double? elevation;
  final Color? backgroundColor;
  final double radius;
  final bool withoutCustomSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Bounce(
      duration: const Duration(milliseconds: 100),
      tapDelay: const Duration(milliseconds: 100),
      tilt: false,
      onTap: isLoading ? null : onPressed,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          minimumSize: withoutCustomSize ? null : Size(size.width, height),
          backgroundColor: backgroundColor ?? ColorConstant.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: ColorConstant.whiteColor,
                  ),
                ),
              )
            : withIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: labelStyle,
                      ).tr(),
                      const SizedBox(width: 8),
                      icon ?? const SizedBox(),
                    ],
                  )
                : Text(
                    label,
                    style: labelStyle,
                  ).tr(),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.labelStyle,
    this.isLoading = false,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 0.5,
    this.height = 50,
    this.withIcon = false,
    this.icon,
  });

  final String label;
  final TextStyle labelStyle;
  final void Function()? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? borderColor;
  final double elevation;
  final double height;
  final bool withIcon;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Bounce(
      duration: const Duration(milliseconds: 100),
      tapDelay: const Duration(milliseconds: 100),
      tilt: false,
      scale: onPressed != null ? true : false,
      onTap: onPressed,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(size.width, height),
          elevation: elevation,
          // ignore: deprecated_member_use
          backgroundColor: onPressed == null ? ColorConstant.greyColor1.withOpacity(0.1) : backgroundColor ?? ColorConstant.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          side: BorderSide(
            color: borderColor ?? ColorConstant.primaryColor,
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: ColorConstant.whiteColor,
                  ),
                ),
              )
            : withIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: labelStyle,
                      ).tr(),
                      const SizedBox(width: 8),
                      icon ?? const SizedBox(),
                    ],
                  )
                : Text(
                    label,
                    style: labelStyle,
                  ).tr(),
      ),
    );
  }
}
