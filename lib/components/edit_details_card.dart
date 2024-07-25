// ignore_for_file: library_private_types_in_public_api

import '../core/flutter_flow/flutter_flow_theme.dart';
import '../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileInputWidget extends StatefulWidget {
  const EditProfileInputWidget(
      {super.key,
      required this.lable,
      required this.controller,
      this.enabled = true});

  final String lable;
  final TextEditingController controller;
  final bool enabled;
  // final String hintText;

  @override
  _EditProfileInputWidgetState createState() => _EditProfileInputWidgetState();
}

class _EditProfileInputWidgetState extends State<EditProfileInputWidget> {
  FocusNode textFieldFocusNode = FocusNode();
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState() {
    super.initState();
    textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    textFieldFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        widget.lable,
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: widget.enabled
                          ? Color(0xFFF8FCFF)
                          : Color.fromARGB(107, 158, 158, 158),
                    ),
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: TextFormField(
                        controller: widget.controller,
                        focusNode: textFieldFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabled: widget.enabled,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito',
                                color: const Color(0xFF252222),
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintText: "",
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFC4D7E5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFC4D7E5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 14,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 6)),
            ),
          ),
        ],
      ),
    );
  }
}
