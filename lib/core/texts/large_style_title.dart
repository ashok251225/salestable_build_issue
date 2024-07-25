import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

// ignore: must_be_immutable
class LargeStyleTitle extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  FontWeight? fontWeight = FontWeight.w500;
  double? fontSize = 14;
  Color? color;

  LargeStyleTitle({
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
      style: FlutterFlowTheme.of(context).titleLarge.override(
            fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
            color: color ?? FlutterFlowTheme.of(context).primaryText,
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
