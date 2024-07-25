import 'package:salestable/components/dashboard/admin_dashboard/competetiverate_widget.dart';
import 'package:salestable/components/dashboard/admin_dashboard/contractvalue_widget.dart';
import 'package:salestable/components/dashboard/admin_dashboard/dashboard_barchart_pulse_widget.dart';
import 'package:salestable/components/dashboard/admin_dashboard/goaltracking_widget.dart';
import 'package:salestable/components/dashboard/admin_dashboard/onboarding_widget.dart';
import 'package:salestable/components/dashboard/admin_dashboard/ramptime_widget.dart';
import 'package:salestable/components/dashboard/admin_dashboard/trainingoverview_widget.dart';
import 'package:salestable/components/dashboard/admin_dashboard/winrate_widget.dart';
import 'package:salestable/components/notifications/notifications_count_widget.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import '../../core/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'admin_dashboard_model.dart';
export 'admin_dashboard_model.dart';

class AdminDashboardWidget extends StatefulWidget {
  const AdminDashboardWidget({super.key});

  @override
  State<AdminDashboardWidget> createState() => _AdminDashboardWidgetState();
}

class _AdminDashboardWidgetState extends State<AdminDashboardWidget> {
  late AdminDashboardModel _model;
  late Future<void> _modelFuture;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminDashboardModel());
    _modelFuture = fetchData();
  }

  Future<void> fetchData() async {
    await Future.wait([
      _model.fetchOverallDetails(),
      _model.fetchTrainingDetails(),
      _model.fetchOnboardingDetails(),
      _model.fetchGoalTrackingDetails(),
      _model.fetchPostCountforAdmin()
    ]);
  }

  Future<void> _refreshData() async {
    setState(() {
      _modelFuture = fetchData();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
            bottomNavigationBar: const BottomNavigation(activeIndex: 0),
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: FutureBuilder<void>(
              future: _modelFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Return a loading indicator or placeholder while the data is being fetched
                  return LoadingAll();
                } else if (snapshot.hasError) {
                  // Handle error case
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  // Data has been fetched, continue building your UI
                  return RefreshIndicator(
                    onRefresh: _refreshData,
                    child: Container(
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(03),
                                                  child: Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/897/600',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  '${GetHelper.getUserFirstName()} ${GetHelper.getUserLastName()}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Color(
                                                                            0xFF0494FD),
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            '',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: Color(
                                                      0xFF5793F1), // Background color
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          26), // Border radius
                                                ),
                                                child:
                                                    const NotificationsCountWidget()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Welcome !',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily,
                                                color: Color(0xFF121010),
                                                fontSize: 20,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLargeFamily),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF5793F1),
                                        Color(0xFF145CDD)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0.03, -1),
                                      end: AlignmentDirectional(-0.03, 1),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    border: Border.all(
                                      color: Color(0xFF145CDD),
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: wrapWithModel(
                                                model:
                                                    _model.competetiverateModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: CompetetiverateWidget(
                                                    value: _model.overallData!
                                                        .trainingCompletionRate),
                                              ),
                                            ),
                                            Expanded(
                                              child: wrapWithModel(
                                                model:
                                                    _model.contractvalueModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: ContractvalueWidget(
                                                    contractVal: _model
                                                        .overallData!
                                                        .averageContractValue),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: wrapWithModel(
                                                model: _model.ramptimeModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: RamptimeWidget(
                                                    rampTimeVal: _model
                                                        .overallData!.rampTime),
                                              ),
                                            ),
                                            Expanded(
                                              child: wrapWithModel(
                                                model: _model.winrateModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: WinrateWidget(
                                                    winRateVal: _model
                                                        .overallData!
                                                        .customerWinRate),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8)),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                      ].divide(SizedBox(height: 8)),
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF145CDD),
                                        border: Border.all(
                                          color: Color(0xFF145CDD),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          wrapWithModel(
                                            model: _model.trainingoverviewModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: TrainingoverviewWidget(
                                                trainingData:
                                                    _model.trainingData),
                                          ),
                                          wrapWithModel(
                                            model: _model.onboardingModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: OnboardingWidget(
                                                onBoardingData:
                                                    _model.onBoardingData),
                                          ),
                                          wrapWithModel(
                                            model: _model.goaltrackingModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: GoaltrackingWidget(
                                                goalTrackingData:
                                                    _model.goalTrackingData),
                                          ),
                                          PulseBarchartWidget(
                                              postCountData:
                                                  _model.postCountData),
                                        ].divide(SizedBox(height: 24)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]
                              .divide(SizedBox(height: 24))
                              .addToEnd(SizedBox(height: 40)),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
