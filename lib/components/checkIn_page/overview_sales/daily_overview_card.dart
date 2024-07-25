import 'package:numeral/numeral.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/models/checkin_overview_response.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyOverviewCard extends StatelessWidget {
  const DailyOverviewCard({super.key, required this.filteredGoal});
  final FilteredGoal filteredGoal;

  String proIcon() {
    if (filteredGoal.name == "Leads") {
      return "leads_target.svg";
    } else if (filteredGoal.name == "Followups on leads") {
      return 'followups_on_leads.svg';
    } else if (filteredGoal.name == "Appointments set") {
      return 'appointments_set.svg';
    } else if (filteredGoal.name == "Appointments held") {
      return 'appointments_held.svg';
    } else {
      return 'test_icon.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).checkinCardColor2,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                        height: 24,
                        width: 24,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MediumStyleTitle(
                    fontSize: 14,
                    text: filteredGoal.name.length > 19
                        ? '${filteredGoal.name.substring(0, 19)}...'
                        : filteredGoal.name,
                    color: FlutterFlowTheme.of(context).smallText,
                  ),
                ),
              ].divide(const SizedBox(width: 4)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Achieved',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).smallText,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                    ),
                    Text(
                      filteredGoal.goalData.totalUsersTarget <= 1000
                          ? filteredGoal.goalData.totalUsersTarget
                              .toInt()
                              .toString()
                          : filteredGoal.goalData.totalUsersTarget
                              .toInt()
                              .numeral()
                              .toString(),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            color: FlutterFlowTheme.of(context).mediumText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Target',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).smallText,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                    ),
                    Text(
                      filteredGoal.goalData.expectedTarget <= 1000
                          ? filteredGoal.goalData.expectedTarget
                              .toInt()
                              .toString()
                          : filteredGoal.goalData.expectedTarget
                              .toInt()
                              .numeral()
                              .toString(),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            color: FlutterFlowTheme.of(context).mediumText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(width: 32)),
            ),
          ].divide(const SizedBox(height: 12)),
        ),
      ),
    );
  }
}
