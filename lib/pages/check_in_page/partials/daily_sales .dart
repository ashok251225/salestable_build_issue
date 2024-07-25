import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/checkIn_page/sales/daily_sales_card.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../models/get_goals_response.dart';
import '../../../core/shared/data_component.dart';

class DailySales extends StatelessWidget {
  const DailySales(
      {super.key, required this.description, required this.dailySalesActivity});
  final String description;
  final List<DataOFGoal> dailySalesActivity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).chekckInBg,
          border: Border.all(color: FlutterFlowTheme.of(context).checkInBorder),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).dailycolor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 7, 8, 7),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Daily',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Sales Activity',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                color: FlutterFlowTheme.of(context).mediumText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(
                            'assets/images/sales_activity.svg',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            description,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).smallText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 8))),
                ].divide(const SizedBox(height: 11)),
              ),
              DataComponent(
                  noDataPath: 'assets/images/no_checkin.svg',
                  noDataText: "No Checkin",
                  hasData: dailySalesActivity.isNotEmpty,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Adjust as needed
                            childAspectRatio: 4 / 2.5,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemCount: dailySalesActivity.length,
                    itemBuilder: (context, index) => DailySalesCard(
                      dailySalesActivity: dailySalesActivity[index],
                    ),
                  )),
              Container(
                decoration: const BoxDecoration(),
              ),
            ].divide(const SizedBox(height: 16)),
          ),
        ),
      ),
    );
  }
}
