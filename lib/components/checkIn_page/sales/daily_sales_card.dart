import 'package:salestable/models/get_goals_response.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DailySalesCard extends StatelessWidget {
  const DailySalesCard({super.key, required this.dailySalesActivity});
  final DataOFGoal dailySalesActivity;

  String proIcon() {
    if (dailySalesActivity.name == "Leads") {
      return "leads_target.svg";
    } else if (dailySalesActivity.name == "Followups on leads") {
      return 'followups_on_leads.svg';
    } else if (dailySalesActivity.name == "Appointments set") {
      return 'appointments_set.svg';
    } else if (dailySalesActivity.name == "Appointments held") {
      return 'appointments_held.svg';
    } else {
      return 'test_icon.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x17000000),
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).checkinCardColor2,
            FlutterFlowTheme.of(context).checkinCardColor2,
          ],
          stops: const [0, 1],
          begin: const AlignmentDirectional(0.03, -1),
          end: const AlignmentDirectional(-0.03, 1),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).addComment,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: SvgPicture.asset(
                                'assets/images/${proIcon()}',
                                color: Colors.white,
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            dailySalesActivity.name!.length > 19
                                ? '${dailySalesActivity.name!.substring(0, 19)}...'
                                : dailySalesActivity.name!,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontSize: 12.5,
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context).smallText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 4)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Goal Target',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.normal,
                              color: FlutterFlowTheme.of(context).smallText,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Text(
                        dailySalesActivity.target!.toInt().toString(),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .titleMediumFamily,
                              fontWeight: FontWeight.w500,
                              color: FlutterFlowTheme.of(context).mediumText,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleMediumFamily),
                            ),
                      ),
                    ].divide(const SizedBox(width: 5)),
                  ),
                ].divide(const SizedBox(height: 10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
