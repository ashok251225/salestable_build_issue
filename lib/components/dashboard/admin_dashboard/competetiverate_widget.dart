// TODO Implement this library.import '/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'competetiverate_model.dart';
export 'competetiverate_model.dart';

class CompetetiverateWidget extends StatefulWidget {
  const CompetetiverateWidget({super.key, required this.value});
  final double value;

  @override
  State<CompetetiverateWidget> createState() => _CompetetiverateWidgetState();
}

class _CompetetiverateWidgetState extends State<CompetetiverateWidget> {
  late CompetetiverateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompetetiverateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x4CFFFFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0x66FFFFFF),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.value}%',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                  lineHeight: 1,
                                ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Completion rate',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                              lineHeight: 1,
                            ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: SvgPicture.asset(
                        'assets/images/admin_competetion_rate.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 6)),
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.max,
            //  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     // ClipRRect(
            //     //   borderRadius: BorderRadius.circular(0),
            //     //   child: SvgPicture.asset(
            //     //     'assets/images/Frame_1794.svg',
            //     //     fit: BoxFit.cover,
            //     //   ),
            //     // ),

            //   ],
            // ),
          ].divide(const SizedBox(height: 12)),
        ),
      ),
    );
  }
}
