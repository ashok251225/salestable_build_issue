// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/shared/page_header.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/snapshot_error_handler2.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import 'package:salestable/pages/check_in_page/partials/overview_sales.dart';
import '../../core/support/support.dart';
import '../../core/shared/new_user_no_data.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'check_in_page_model.dart';
import '../../controllers/checkin_controller.dart';
import 'partials/checkin_tabbar.dart';
import 'partials/sales_goals_component.dart';
export 'check_in_page_model.dart';

class CheckInPageWidget extends StatefulWidget {
  const CheckInPageWidget({
    super.key,
  });

  @override
  _CheckInPageWidgetState createState() => _CheckInPageWidgetState();
}

class _CheckInPageWidgetState extends State<CheckInPageWidget>
    with TickerProviderStateMixin {
  late CheckInPageModel _model;

  late Future<void> _futureData;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final CheckinController _checkinController = Get.put(CheckinController());

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckInPageModel());
    _checkinController.selectedDate =
        Get.arguments != null ? Get.arguments['date'] : DateTime.now();

    _futureData = fetchData();
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  bool _validDate() {
    final selectedDateFormatted =
        Support.formatDate(value: _checkinController.selectedDate.toString());
    final todayFormatted = Support.formatDate(value: DateTime.now().toString());
    final yesterdayFormatted = Support.formatDate(
        value: DateTime.now().subtract(const Duration(days: 1)).toString());

    return selectedDateFormatted == todayFormatted ||
        selectedDateFormatted == yesterdayFormatted;
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, DateTime.august);
    final lastDate = now;

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _checkinController.selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (pickedDate != null) {
      _checkinController.updateSelectedDate(
          pickedDate); // Update selected date using controller
      _checkinController.updateLoadingValue(true);
      await _model.fetchDateWiseCheckIn(
        date: Support.formatDate(value: pickedDate.toString()),
      );
      _checkinController.updateLoadingValue(false);
    }
  }

  Future<void> fetchData() async {
    await Future.wait([
      _model.fetchSalesGoals(),
      _model.fetchCurrentCheckIn(),
      _model.fetchDateWiseCheckIn(
          date: Support.formatDate(
              value: _checkinController.selectedDate.toString()))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: PopScope(
          canPop: false,
          child: SafeArea(
            child: Scaffold(
                bottomNavigationBar: const BottomNavigation(activeIndex: 1),
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: GetHelper.getIsReady()
                    ? FutureBuilder(
                        future: _futureData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return LoadingAll();
                          } else if (snapshot.hasError) {
                            return SnapshotErrorHandler(
                              snapshot: snapshot,
                            );
                          } else {
                            return _model.filteredData.isNotEmpty
                                ? Stack(
                                    children: [
                                      const PageHeader(
                                        pageTitle: 'Check In',
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 62),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(12, 16, 12, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cardColor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    topRight:
                                                        Radius.circular(16),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    CheckinTabBar(
                                                      tabController: _model
                                                          .tabBarController!,
                                                    ),
                                                    Expanded(
                                                      child: TabBarView(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        controller: _model
                                                            .tabBarController,
                                                        children: [
                                                          GetBuilder<
                                                              CheckinController>(
                                                            builder: (_checkinController) => OverviewSales(
                                                                salesGoals: _model
                                                                    .salesGoals!,
                                                                filteredGoal: _model
                                                                    .filteredGoal,
                                                                onDate:
                                                                    _presentDatePicker,
                                                                validDate:
                                                                    _validDate,
                                                                isCheckedIn: _model
                                                                    .isCheckInExisted),
                                                          ),
                                                          SalesGoalsTargets(
                                                            dailySalesActivity:
                                                                _model
                                                                    .dailySalesActivity,
                                                            dailyDescription: _model
                                                                .dailyDescription,
                                                            monthlySalesGoals:
                                                                _model
                                                                    .monthlySalesGoals,
                                                            monthlyDescription:
                                                                _model
                                                                    .monthlyDescription,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/new_user_no_data.svg",
                                          fit: BoxFit.cover,
                                          height: 250,
                                          width: 250,
                                        ),
                                        MediumStyleTitle(
                                          text: "Goal Tracking not available",
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        SmallStyleTitle(
                                          text:
                                              "Seems goal tracking module is not yet published,",
                                          fontSize: 12,
                                          textAlign: TextAlign.center,
                                          color: FlutterFlowTheme.of(context)
                                              .smallText,
                                        ),
                                        SmallStyleTitle(
                                          text: "kindly check later",
                                          fontSize: 12,
                                          textAlign: TextAlign.center,
                                          color: FlutterFlowTheme.of(context)
                                              .smallText,
                                        ),
                                      ].divide(
                                        const SizedBox(height: 12),
                                      ),
                                    ),
                                  );
                          }
                        })
                    : GetHelper.getUserType() != "1"
                        ? const NewUserNoData(
                            noDataText: "Goal Tracking not available")
                        : const SnapshotErrorHandler2()),
          ),
        ));
  }
}
