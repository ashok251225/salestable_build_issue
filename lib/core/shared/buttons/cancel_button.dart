import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_widgets.dart';

class CancelButton extends StatelessWidget {
  final Color? buttonColor;

  final Function()? onPressed;
  final String label;
  final double? width;

  const CancelButton(
      {super.key,
      this.buttonColor,
      this.label = "Cancel",
      this.onPressed,
      this.width});

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: onPressed ??
          () {
            Get.back();
          },
      text: label,
      options: FFButtonOptions(
        color: Colors.transparent,
        elevation: 0,
        height: 40,
        width: width ?? MediaQuery.of(context).size.width * 0.35,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: FlutterFlowTheme.of(context).loginText,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).addComment,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
