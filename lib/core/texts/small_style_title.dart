import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

// ignore: must_be_immutable
class SmallStyleTitle extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final TextAlign? textAlign;
  FontWeight? fontWeight = FontWeight.w500;
  double? fontSize = 14;
  int maxLines;
  double lineHeight;
  Color? color = Color(0xFF090909);

  SmallStyleTitle({
    super.key,
    required this.text,
    this.lineHeight = 1,
    this.maxLines = 2,
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
      style: FlutterFlowTheme.of(context).bodySmall.override(
            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            lineHeight: lineHeight,
          ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
