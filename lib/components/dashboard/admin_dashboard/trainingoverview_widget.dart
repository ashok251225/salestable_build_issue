// TODO Implement this library.
import 'package:pie_chart/pie_chart.dart';
import 'package:salestable/models/admin_training_overview_resp.dart';
import 'dart:math' as math;
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'trainingoverview_model.dart';
export 'trainingoverview_model.dart';

class TrainingoverviewWidget extends StatefulWidget {
  const TrainingoverviewWidget({super.key, required this.trainingData});
  final Data? trainingData;

  @override
  State<TrainingoverviewWidget> createState() => _TrainingoverviewWidgetState();
}

class _TrainingoverviewWidgetState extends State<TrainingoverviewWidget> {
  late TrainingoverviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingoverviewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  final List<Color> colorList = [
    const Color(0xFFEB9B42),
    const Color(0xFF2DC38D),
    const Color(0xFFF6CB6C),
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      "In Progress": widget.trainingData!.progress.inProgressCount.toDouble(),
      "Completed": widget.trainingData!.progress.completedCount.toDouble(),
      "Yet to start": widget.trainingData!.progress.yetToStartCount.toDouble(),
    };
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border.all(
                color: Color(0xFFC4C4C4),
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Training Overview',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: Color(0xFF090909),
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PieChart(
                    chartType: ChartType.ring,
                    dataMap: dataMap,
                    animationDuration: const Duration(milliseconds: 800),
                    chartRadius:
                        math.min(MediaQuery.of(context).size.width / 3.2, 300),
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    centerText: "",
                    legendOptions: const LegendOptions(showLegends: false),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValues: false,
                    ),
                    emptyColor: Colors.grey,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.rectangle_rounded,
                                color: Color(0xFF2DC38D),
                                size: 18,
                              ),
                              Text(
                                'Completed',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Color(0xFF6D8698),
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${widget.trainingData!.progress.completedCount}',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Color(0xFF31485E),
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 10)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.rectangle_rounded,
                                color: Color(0xFFEB9B42),
                                size: 18,
                              ),
                              Text(
                                'In Progress',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Color(0xFF6D8698),
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${widget.trainingData!.progress.inProgressCount}',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Color(0xFF31485E),
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 10)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.rectangle_rounded,
                            color: Color(0xFFF6CB6C),
                            size: 18,
                          ),
                          Text(
                            'Yet to start',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Color(0xFF6D8698),
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '${widget.trainingData!.progress.yetToStartCount}',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Color(0xFF314A5E),
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 10)),
                      ),
                    ].divide(SizedBox(height: 16)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE0F1FF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${widget.trainingData!.progress.totalModule}',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Total modules available',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Color(0xFF494949),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 8)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE0F1FF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${widget.trainingData!.totalReadinessIndex}%',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Sales Readiness Index',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Color(0xFF494949),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 8)),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 12)),
                  ),
                ].divide(SizedBox(height: 20)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
