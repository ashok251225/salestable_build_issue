import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/checkIn_page/sales/monthly_sales_card.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/models/get_goals_response.dart';
import 'package:salestable/core/shared/data_component.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';

class MonthlySales extends StatelessWidget {
  const MonthlySales(
      {super.key, required this.monthlySalesGoals, required this.description});
  final List<DataOFGoal> monthlySalesGoals;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: FlutterFlowTheme.of(context).checkInBorder),
            color: FlutterFlowTheme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                           FlutterFlowTheme.of(context).monthlycolor,
                           FlutterFlowTheme.of(context).monthlycolor,
                          ],
                          stops: [0, 0],
                          begin: AlignmentDirectional(0.03, 1),
                          end: AlignmentDirectional(-0.03, -1),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 7, 8, 7),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Monthly',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
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
                            'Sales Goals',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).mediumText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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
                              'assets/images/sales_goals_1.svg',
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
                                    color:
                                        FlutterFlowTheme.of(context).smallText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8))),
                  ].divide(const SizedBox(height: 11)),
                ),
                DataComponent(
                  hasData: monthlySalesGoals.isNotEmpty,
                  noDataPath: 'assets/images/no_checkin.svg',
                  noDataText: "No Checkin",
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Adjust as needed
                            childAspectRatio: 4 / 2.5,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemCount: monthlySalesGoals.length,
                    itemBuilder: (context, index) {
                      return MonthlySalesCard(
                          monthlySalesGoals: monthlySalesGoals[index]);
                    },
                  ),
                ),
              ].divide(const SizedBox(height: 16)),
            ),
          ),
        ),
      ],
    );
  }
}
