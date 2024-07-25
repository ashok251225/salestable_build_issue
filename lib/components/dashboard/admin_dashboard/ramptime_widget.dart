// TODO Implement this library.
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ramptime_model.dart';
export 'ramptime_model.dart';

class RamptimeWidget extends StatefulWidget {
  const RamptimeWidget({super.key, required this.rampTimeVal});
  final String rampTimeVal;

  @override
  State<RamptimeWidget> createState() => _RamptimeWidgetState();
}

class _RamptimeWidgetState extends State<RamptimeWidget> {
  late RamptimeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RamptimeModel());
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
                        '${widget.rampTimeVal}',
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
                        'Ramp Time',
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
                        'assets/images/admin_ramp_Time.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 6)),
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(0),
            //       child: SvgPicture.asset(
            //         'assets/images/Frame_1794_(1).svg',
            //         fit: BoxFit.cover,
            //       ),
            //     ),

            //   ],
            // ),
          ].divide(const SizedBox(height: 12)),
        ),
      ),
    );
  }
}
