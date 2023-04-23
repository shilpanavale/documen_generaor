import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';


class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? border;
  final EdgeInsets? padding;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Color? cursorColor;
  final InputDecoration? decoration;
  final bool? filled;
  final double? height;
  final double? width;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.height,
    this.textInputAction,
    this.keyboardType,
    this.filled,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.border,
    this.padding,
    this.cursorColor,
    this.decoration,
    this.onSaved,
    this.validator,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height ?? 55,
      width: width,
      child: TextFormField(
        style: TextHelper.h14.copyWith(fontWeight: FontWeight.normal),
        cursorColor: cursorColor,
        onSaved: onSaved,
        obscureText: obscureText ?? false,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorsForApp.grayLight)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelText: labelText,
            labelStyle: TextHelper.size14,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:TextHelper.size14.copyWith(color: ColorsForApp.blackColor),
            fillColor: Colors.white,
            filled: filled),
        validator: validator,
      ),
    );
  }
}
class MobileTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? border;
  final EdgeInsets? padding;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Color? cursorColor;
  final InputDecoration? decoration;
  final bool? filled;
  final double? height;
  final double? width;
  const MobileTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.height,
    this.textInputAction,
    this.keyboardType,
    this.filled,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.border,
    this.padding,
    this.cursorColor,
    this.decoration,
    this.onSaved,
    this.validator,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height ?? 55,
      width: width,
      child: TextFormField(
        style: TextHelper.h14.copyWith(fontWeight: FontWeight.normal),
        cursorColor: cursorColor,
        onSaved: onSaved,
        maxLength: 10,
        obscureText: obscureText ?? false,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(95),
                borderSide: BorderSide(color: ColorsForApp.grayLight)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(95),
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelText: labelText,
            counterText: '',
            labelStyle: TextHelper.h14,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:TextHelper.size14.copyWith(color: ColorConverter.hexToColor("#ADA4A5")),
            fillColor: ColorConverter.hexToColor("#F7F8F8"),
            filled: filled),
        validator: validator,
      ),
    );
  }
}
class DisableTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? border;
  final EdgeInsets? padding;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Color? cursorColor;
  final InputDecoration? decoration;
  final bool? filled;
  final double? height;
  final double? width;
  const DisableTextField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.height,
    this.textInputAction,
    this.keyboardType,
    this.filled,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.border,
    this.padding,
    this.cursorColor,
    this.decoration,
    this.onSaved,
    this.validator,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height ?? 55,
      width: width,
      child: TextFormField(
        style: TextHelper.h14.copyWith(fontWeight: FontWeight.normal),
        cursorColor: cursorColor,
        onSaved: onSaved,
        readOnly: true,
        enabled: false,
        obscureText: obscureText ?? false,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorsForApp.grayLight)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelText: labelText,
            labelStyle: TextHelper.size14.copyWith(color: ColorsForApp.blackColor),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:TextHelper.size14.copyWith(color: ColorsForApp.blackColor),

            fillColor: Colors.white,
            filled: filled),
        validator: validator,
      ),
    );
  }
}
