import 'package:salestable/models/goal_tracking_monthly_resp.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'goaltracking_model.dart';
export 'goaltracking_model.dart';

class GoaltrackingWidget extends StatefulWidget {
  const GoaltrackingWidget({super.key, required this.goalTrackingData});

  final GoalTrackingData? goalTrackingData;

  @override
  State<GoaltrackingWidget> createState() => _GoaltrackingWidgetState();
}

class _GoaltrackingWidgetState extends State<GoaltrackingWidget> {
  late GoaltrackingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoaltrackingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<GoalDatum> numOfCustomerCateogry =
        widget.goalTrackingData!.overview[0].goals[0].goalData;
    List<GoalDatum> revenueCategory =
        widget.goalTrackingData!.overview[0].goals[1].goalData;

    Map<String, dynamic> customerCurrentMonth = {};
    Map<String, dynamic> revenueCurrentMonth = {};

    double userExpectedTarget = 0;
    double totalUsersTarget = 0;
    double revenueExpectedTarget = 0;
    double totalRevenueTarget = 0;

    for (GoalDatum eachMonth in numOfCustomerCateogry) {
      if (eachMonth.current) {
        customerCurrentMonth = eachMonth.toJson();

        userExpectedTarget = customerCurrentMonth[
            'expected_target']; // Example total user target
        totalUsersTarget = customerCurrentMonth['total_users_target'];

        break;
      }
    }

    for (GoalDatum eachMonth in revenueCategory) {
      if (eachMonth.current) {
        revenueCurrentMonth = eachMonth.toJson();

        revenueExpectedTarget =
            revenueCurrentMonth['expected_target']; // Example total user target
        totalRevenueTarget = revenueCurrentMonth['total_users_target'];

        break;
      }
    }

    // Example current achieved users

// Ensure that the totalUserTarget is not zero to avoid division by zero error
// double
    double customerProgressPercentage = 0;
    double revenueProgressPercentage = 0;

    if (userExpectedTarget != 0 &&
        totalUsersTarget / userExpectedTarget <= 1.0) {
      customerProgressPercentage = totalUsersTarget / userExpectedTarget;
    } else if (userExpectedTarget != 0 &&
        totalUsersTarget / userExpectedTarget > 1.0) {
      customerProgressPercentage = 1.0;
    } else {
      customerProgressPercentage = 0;
    }

    if (revenueExpectedTarget != 0 &&
        totalRevenueTarget / revenueExpectedTarget <= 1.0) {
      revenueProgressPercentage = totalRevenueTarget / revenueExpectedTarget;
    } else if (revenueExpectedTarget != 0 &&
        totalRevenueTarget / revenueExpectedTarget > 1.0) {
      revenueProgressPercentage = 1.0;
    } else {
      revenueProgressPercentage = 0;
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border.all(
                color: const Color(0xFFC4C4C4),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Goal Tracking',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                color: const Color(0xFF090909),
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF2DC38D),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 4, 12, 4),
                            child: Text(
                              'Monthly',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 8)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFECF7FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
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
                                            widget.goalTrackingData!.overview[0]
                                                .goals[0].name,
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  color: Colors.black,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily),
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: customerCurrentMonth[
                                                          "delta_value"] >=
                                                      0
                                                  ? const Color(0xFF2DC38D)
                                                  : const Color(0xFFF1282E),
                                              size: 18,
                                            ),
                                            Text(
                                              '${customerCurrentMonth["delta_value_text"]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: customerCurrentMonth[
                                                                    "delta_value"] >=
                                                                0
                                                            ? const Color(
                                                                0xFF2DC38D)
                                                            : const Color(
                                                                0xFFF1282E),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 2)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        LinearPercentIndicator(
                                          percent: customerProgressPercentage,
                                          lineHeight: 5,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              const Color(0xFF0494FD),
                                          backgroundColor: Colors.white,
                                          barRadius: const Radius.circular(30),
                                          padding: EdgeInsets.zero,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${customerCurrentMonth["total_users_target_text"]}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/Vector_(1).svg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  '${customerCurrentMonth["expected_target_text"]}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: const Color(
                                                            0xB3000000),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 2)),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 5)),
                                    ),
                                  ].divide(const SizedBox(height: 12)),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.goalTrackingData!.overview[0]
                                                .goals[1].name,
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  color: Colors.black,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily),
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: revenueCurrentMonth[
                                                          "delta_value"] >=
                                                      0
                                                  ? const Color(0xFF2DC38D)
                                                  : const Color(0xFFF1282E),
                                              size: 18,
                                            ),
                                            Text(
                                              '${revenueCurrentMonth["delta_value_text"]}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: revenueCurrentMonth[
                                                                    "delta_value"] >=
                                                                0
                                                            ? const Color(
                                                                0xFF2DC38D)
                                                            : const Color(
                                                                0xFFF1282E),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 2)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        LinearPercentIndicator(
                                          percent: revenueProgressPercentage,
                                          lineHeight: 5,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              const Color(0xFF0494FD),
                                          backgroundColor: Colors.white,
                                          barRadius: const Radius.circular(30),
                                          padding: EdgeInsets.zero,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${revenueCurrentMonth["total_users_target_text"]}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/Vector_(1).svg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  '${revenueCurrentMonth["expected_target_text"]}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: const Color(
                                                            0xB3000000),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 2)),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 5)),
                                    ),
                                  ].divide(const SizedBox(height: 12)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 12)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
