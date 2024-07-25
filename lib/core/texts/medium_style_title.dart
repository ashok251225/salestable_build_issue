import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

// ignore: must_be_immutable
class MediumStyleTitle extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  FontWeight? fontWeight = FontWeight.w500;
  double? fontSize = 14;
  Color? color = const Color(0xFF090909);

  MediumStyleTitle({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.fontFamily,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FlutterFlowTheme.of(context).titleMedium.override(
            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            lineHeight: 1,
          ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
