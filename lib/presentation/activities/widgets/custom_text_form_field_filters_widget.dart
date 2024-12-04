import 'package:flutter/material.dart';
import 'package:town_square/config/theme/custom_colors.dart';

class CustomTextFormFieldFiltersWidget extends StatelessWidget {
  final String? label;
  final bool readOnly;
  final double? height;
  final int? maxLines;
  final TextEditingController? controller;
  final TextStyle? style;
  final String? initialValue;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final IconData? suffixIconData;
  final Widget? suffixIcon;

  final Widget? prefix;
  final void Function()? onTap;
  final bool showOnly;

  const CustomTextFormFieldFiltersWidget({
    super.key,
    this.height,
    this.readOnly = false,
    this.initialValue,
    this.controller,
    this.label,
    this.style,
    this.hint,
    this.maxLines,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.suffixIconData,
    this.onTap,
    this.prefix,
    this.suffixIcon,
    this.showOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FocusScope(
      node: showOnly ? FocusScopeNode() : null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextFormField(
          onTap: onTap,
          controller: controller,
          readOnly: readOnly,
          maxLines: maxLines ?? 1,
          textDirection: TextDirection.ltr,
          expands: false,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          style: const TextStyle(color: CustomColors.neutral),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: suffixIcon ??
                  Icon(
                    size: 32,
                    suffixIconData,
                    color: const Color(0xFFADB5BD),
                  ),
            ),
            prefixIcon: prefix,
            floatingLabelStyle: const TextStyle(
                color: CustomColors.neutral,
                fontWeight: FontWeight.bold,
                fontSize: 14),

            //border: InputBorder.none,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(
                color: CustomColors.neutral,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            errorText: errorMessage,
            focusColor: colors.primary,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: const EdgeInsets.only(top: 8, left: 30, bottom: 8),
          ),
        ),
      ),
    );
  }
}
