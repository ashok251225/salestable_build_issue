import 'package:flutter/material.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_widgets.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final double? Width;
  final Color? disabledColor;
  final bool showLoadingIndicator;
  final Function() onPressed;
  final Color? color;
  const SubmitButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.disabledColor,
      this.showLoadingIndicator = true,
      this.color,
      this.Width});

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      showLoadingIndicator: showLoadingIndicator,
      onPressed: onPressed,
      text: label,
      options: FFButtonOptions(
        disabledColor: disabledColor,
        width: Width ?? MediaQuery.of(context).size.width * 0.35,
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        color: color ?? FlutterFlowTheme.of(context).addPost,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Nunito',
              color: Colors.white,
            ),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
