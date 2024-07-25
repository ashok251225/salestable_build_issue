import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/forms/form_error_helper.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

class GenericTextFieldforProfile extends StatelessWidget {
  final String? errorKey;
  final Function()? onTap;
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

  const GenericTextFieldforProfile({
    Key? key,
    this.labelText,
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
  }) : super(key: key);

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
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              label!,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        },
        TextField(
          onTap: onTap,
          style: fieldenabled
              ? Theme.of(context).textTheme.bodyMedium
              : TextStyle(fontSize: 14, color: Colors.black),
          autofocus: autofocus,
          obscureText: obscureText,
          maxLines: maxLines,
          enabled: fieldenabled,
          keyboardType: textInputType,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                  color: Color(0xFF8391A1),
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleMediumFamily),
                ),
            alignLabelWithHint: false,
            hintStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Nunito',
                  color: Color(0xFF464646),
                  fontSize: 15.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleSmallFamily),
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF8391A1),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: EdgeInsets.all(14.0),
            suffixIcon: suffixIcon,
            errorText: message(),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
