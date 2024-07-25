import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

class FormSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final IconButton? iconButton;
  final String? hintText;
  final String? Function(String?)? validator;

  const FormSearchField(
      {super.key,
      required this.controller,
      required this.onChanged,
      this.hintText,
      this.validator,
      this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 44.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).smallText,
          ),
        ),
        child: TextFormField(
          controller: controller,
          onChanged: (String value) => onChanged(value),
          obscureText: false,
          decoration: InputDecoration(
            icon: iconButton,
            labelStyle: FlutterFlowTheme.of(context).labelLarge,
            hintText: hintText,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(
              24.0,
              12.0,
              12.0,
              12.0,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/magnifying-glass.svg',
                color: FlutterFlowTheme.of(context).smallText,
              ),
            ),
          ),
          style: FlutterFlowTheme.of(context).bodyLarge,
          textAlign: TextAlign.start,
          validator: validator,
        ),
      ),
    );
  }
}
