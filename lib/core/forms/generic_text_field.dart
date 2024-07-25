import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/forms/form_error_helper.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/texts/medium_style_title.dart';

class GenericTextField extends StatelessWidget {
  final bool hasDigitsOnly;
  final String? errorKey;
  final double? borderRadius;
  // final Color? outlineBorderColor;
  final Function()? onTap;
  final Function(String? value)? validator;
  final String? label;
  final String? labelText;
  final double? fieldSize;
  final bool obscureText;
  final bool required;
  final bool fieldenabled;
  final bool autofocus;
  final int maxLines;
  final Widget? suffixIcon;
  final Map<String, dynamic>? errors;
  final TextEditingController controller;
  final String? hint;
  final TextInputType? textInputType;
  final Function(String?)? onChanged;

  const GenericTextField(
      {super.key,
      this.hasDigitsOnly = true,
      this.labelText,
      this.borderRadius,
      this.onTap,
      this.obscureText = false,
      this.autofocus = false,
      this.fieldSize,
      this.label,
      this.suffixIcon,
      this.maxLines = 1,
      this.fieldenabled = false,
      this.hint,
      this.required = false,
      this.errors,
      required this.controller,
      this.textInputType,
      this.onChanged,
      this.errorKey,
      this.validator});

  String? message() {
    if (errorKey != null) {
      return FormErrorHelper(errors: errors).message(errorKey!);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...{
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: MediumStyleTitle(
              text: label!,
              fontSize: 14,
              color: FlutterFlowTheme.of(context).mediumText,
            ),
          )
        },
        TextFormField(
          validator: (value) => validator!(value),
          maxLength: hasDigitsOnly ? 7 : null,
          inputFormatters:
              hasDigitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
          onTap: onTap,
          style: fieldenabled
              ? Theme.of(context).textTheme.bodyMedium
              : TextStyle(
                  fontSize: 14, color: FlutterFlowTheme.of(context).cardColor),
          autofocus: autofocus,
          obscureText: obscureText,
          maxLines: maxLines,
          enabled: fieldenabled,
          keyboardType: textInputType ?? TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: FlutterFlowTheme.of(context).focusColor,
            counterText: '',
            hintText: labelText,
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  color: const Color(0xFFAAAAAA),
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            alignLabelWithHint: false,
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  color: const Color(0xFFAAAAAA),
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).trainingCardBorder,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
            ),
            disabledBorder: OutlineInputBorder(
              // Added disabled border
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context)
                    .trainingCardBorder, // Use the same color as enabled border
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).addComment,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
            ),
            contentPadding: const EdgeInsets.all(14.0),
            suffixIcon: suffixIcon,
            errorText: message(),
          ),
          onChanged: (text) {
            // Check if the entered text is empty
            if (text.isEmpty && hasDigitsOnly) {
              // Set a default value or empty string as needed
              controller.text = "O";
            }

            onChanged?.call(text);
          },
        ),
      ],
    );
  }
}
