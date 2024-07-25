import 'package:flutter/material.dart';
import 'package:salestable/core/forms_for_profile/generic_text_field_for_profile.dart';

class FormTextFieldProfile extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onTap;
  final double? fieldSize;
  final bool autofocus;
  final int maxLines;
  final bool obscureText;
  final String hintText;
  final String? label;
  final String? labeltext;
  final String? errorKey;
  final bool enabled;
  final Widget? suffixIcon;
  final Map<String, dynamic>? errors;
  final TextInputType? textInputType;

  const FormTextFieldProfile(
      {super.key,
      required this.controller,
      this.onTap,
      this.fieldSize,
      this.textInputType,
      this.obscureText = false,
      this.suffixIcon,
      this.maxLines = 1,
      this.enabled = true,
      this.hintText = '',
      this.errorKey,
      this.errors,
      this.autofocus = false,
      this.label,
      this.labeltext});

  @override
  Widget build(BuildContext context) {
    return GenericTextFieldforProfile(
      onTap: onTap,
      fieldSize: fieldSize,
      obscureText: obscureText,
      maxLines: maxLines,
      fieldenabled: enabled,
      suffixIcon: suffixIcon,
      controller: controller,
      hint: hintText,
      label: label,
      errorKey: errorKey,
      errors: errors,
      textInputType: textInputType,
      autofocus: autofocus,
      labelText: labeltext,
    );
  }
}
