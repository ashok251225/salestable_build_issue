// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/checkIn_page/overview_sales/daily_overview_card.dart';
import 'package:salestable/controllers/checkin_controller.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_widgets.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/shared/data_component.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/models/checkin_overview_response.dart';
import 'package:salestable/models/current_check_in_response.dart';
import 'package:salestable/pages/check_in_page/partials/overview_monthly.dart';

class OverviewSales extends StatelessWidget {
  OverviewSales(
      {super.key,
      required this.filteredGoal,
      required this.onDate,
      required this.validDate,
      required this.isCheckedIn,
      required this.salesGoals});
  List<FilteredGoal> filteredGoal = [];
  final VoidCallback onDate;
  final bool Function() validDate;
  final bool isCheckedIn;
  List<Goal> salesGoals = [];

  @override
  Widget build(BuildContext context) {
    final CheckinController _checkinController = Get.put(CheckinController());
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 12, 12, 24),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .checkInBorder,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .cardColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 6),
                                          child: InkWell(
                                            onTap: () {
                                              onDate();
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/calendar-blank_1_(2).svg',
                                                  width: 10.5,
                                                  height: 11.38,
                                                  fit: BoxFit.cover,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .checkinTitleColor2,
                                                ),
                                                GetBuilder<CheckinController>(
                                                  builder:
                                                      (_checkinController) =>
                                                          Text(
                                                    Support.formatDate(
                                                        value:
                                                            _checkinController
                                                                .selectedDate
                                                                .toString(),
                                                        format: 'dd MMM yyyy'),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .mediumText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 4)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () {
                                        validDate()
                                            ? Get.toNamed(Routes.editcheckin,
                                                arguments: {
                                                    'date': _checkinController
                                                        .selectedDate, // Assuming selectedDate is the date parameter
                                                  })
                                            : null;
                                      },
                                      text: isCheckedIn ? 'Edit' : "Check In",
                                      icon: FaIcon(
                                        FontAwesomeIcons.edit,
                                        color: validDate()
                                            ? FlutterFlowTheme.of(context)
                                                .checkinColor
                                            : Colors.grey,
                                        size: 16,
                                      ),
                                      options: FFButtonOptions(
                                        height: 32,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 0, 24, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context)
                                            .cardColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: validDate()
                                                  ? FlutterFlowTheme.of(context)
                                                      .checkinColor
                                                  : Colors.grey,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .checkInBorder,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 16)),
                                ),
                                MonthlyOverView(
                                  salesGoals: salesGoals,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: SvgPicture.asset(
                                        'assets/images/list-checks_1.svg',
                                        fit: BoxFit.cover,
                                        color: FlutterFlowTheme.of(context)
                                            .checkinTitleColor2,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Sales Activity',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .checkinTitleColor2,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8)),
                                ),
                                GetBuilder<CheckinController>(
                                    builder: (_checkinController) {
                                  return DataComponent(
                                    isLoading: _checkinController.isLoading,
                                    hasData: filteredGoal.isNotEmpty,
                                    noDataPath: 'assets/images/no_checkin.svg',
                                    noDataText: "No Checkin",
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // Adjust as needed
                                              childAspectRatio: 4 / 2.9,
                                              crossAxisSpacing: 8,
                                              mainAxisSpacing: 8),
                                      itemCount: filteredGoal.length,
                                      itemBuilder: (context, index) =>
                                          DailyOverviewCard(
                                        filteredGoal: filteredGoal[index],
                                      ),
                                    ),
                                  );
                                })
                              ].divide(const SizedBox(height: 16)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
