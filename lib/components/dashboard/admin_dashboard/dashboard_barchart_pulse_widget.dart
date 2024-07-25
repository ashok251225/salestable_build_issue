// TODO Implement this library.import '/flutter_flow/flutter_flow_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:salestable/components/dashboard/admin_dashboard/dashboard_barchart_pulse_model.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/models/get_post_count_response.dart';

import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'contractvalue_model.dart';
export 'contractvalue_model.dart';

class PulseBarchartWidget extends StatefulWidget {
  const PulseBarchartWidget({super.key, required this.postCountData});

  final CountData? postCountData;

  @override
  State<PulseBarchartWidget> createState() => _PulseBarchartWidgetState();
}

class _PulseBarchartWidgetState extends State<PulseBarchartWidget> {
  late PulseBarchartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  int interval = 10;
  num peakPoint = 50;
  int magnitude = 1;
  int maxValue = 1;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PulseBarchartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> barNumbers = [
      widget.postCountData!.categories[0].userPostCount,
      widget.postCountData!.categories[1].userPostCount,
      widget.postCountData!.categories[2].userPostCount,
      widget.postCountData!.categories[3].userPostCount,
      widget.postCountData!.categories[4].userPostCount
    ];
    maxValue = barNumbers
        .reduce((value, element) => value > element ? value : element);
    magnitude = maxValue.abs().toString().length;

    if (magnitude <= 2) {
      interval = (maxValue ~/ 5) + 1;
      peakPoint = (interval * 5);
    } else {
      interval = ((maxValue ~/ 5) ~/ 10 + 1) * 10;
      peakPoint = (interval * 5);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Colors.black, width: 0.3), // Set border properties
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  'Pulse',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontSize: 17,
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        color: const Color(0xFF090909),
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                ),
              ),
              AspectRatio(
                aspectRatio: 2.0,
                child: BarChart(
                  BarChartData(
                    barTouchData: barTouchData,
                    titlesData: titlesData,
                    borderData: borderData,
                    barGroups: barGroups,
                    gridData: const FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      drawHorizontalLine: false,
                    ),
                    alignment: BarChartAlignment.spaceEvenly,
                    maxY: peakPoint.toDouble(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/pulse_lessons_learned.svg',
                                    fit: BoxFit.cover,
                                    height: 16,
                                  ),
                                ),
                                Text(
                                  'Lessons Learned',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontSize: 13,
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: const Color(0xFF6D869A),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ].divide(const SizedBox(width: 8)),
                            ),
                            Text(
                              '${widget.postCountData!.categories[0].userPostCount}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontSize: 13,
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: const Color(0xFF314A5E),
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 5)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/pulse_best_practices.svg',
                                    fit: BoxFit.cover,
                                    height: 16,
                                  ),
                                ),
                                Text(
                                  'Best Practices',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: const Color(0xFF6D869A),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ].divide(const SizedBox(width: 8)),
                            ),
                            Text(
                              '${widget.postCountData!.categories[1].userPostCount}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: const Color(0xFF314A5E),
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 5)),
                        ),
                      ].divide(const SizedBox(width: 25)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/pulse_thoughts.svg',
                                    fit: BoxFit.cover,
                                    height: 16,
                                  ),
                                ),
                                Text(
                                  'Thoughts',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontSize: 13,
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: const Color(0xFF6D869A),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ].divide(const SizedBox(width: 8)),
                            ),
                            Text(
                              '${widget.postCountData!.categories[2].userPostCount}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontSize: 13,
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: const Color(0xFF314A5E),
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 5)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                      'assets/images/pulse_daily_boost.svg',
                                      colorFilter: const ColorFilter.mode(
                                          Colors.red, BlendMode.colorBurn),
                                      fit: BoxFit.cover,
                                      height: 16),
                                ),
                                Text(
                                  'Daily Boosts',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontSize: 13,
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: const Color(0xFF6D869A),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ].divide(const SizedBox(width: 8)),
                            ),
                            Text(
                              '${widget.postCountData!.categories[3].userPostCount}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontSize: 13,
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: const Color(0xFF314A5E),
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 5)),
                        ),
                      ].divide(const SizedBox(width: 25)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: SvgPicture.asset(
                                'assets/images/pulse_wins.svg',
                                fit: BoxFit.cover,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                    Colors.yellow, BlendMode.colorBurn),
                              ),
                            ),
                            Text(
                              'Wins',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontSize: 13,
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: const Color(0xFF6D869A),
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 8)),
                        ),
                        Text(
                          '${widget.postCountData!.categories[4].userPostCount}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontSize: 13,
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: const Color(0xFF314A5E),
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ].divide(const SizedBox(width: 5)),
                    ),
                  ].divide(const SizedBox(height: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = const TextStyle(
      color: Color.fromARGB(255, 138, 137, 137),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;

    if (value % interval == 0 && value <= peakPoint) {
      text = value.toInt().toString();
    } else {
      text = '';
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            interval: interval
                .toDouble(), // Set the interval to 5 to display values from 5 to 35

            reservedSize: 25,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
      show: true,
      border: const Border.fromBorderSide(
          BorderSide(color: Colors.grey, style: BorderStyle.none)));

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          groupVertically: true,
          x: 0,
          barRods: [
            BarChartRodData(
                borderRadius: BorderRadius.circular(3),
                toY: widget.postCountData!.categories[0].userPostCount
                    .toDouble(),
                color: Colors.green,
                width: 15)
          ],
          showingTooltipIndicators: [1],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              width: 15,
              toY: widget.postCountData!.categories[1].userPostCount.toDouble(),
              color: Colors.blue,
            )
          ],
          showingTooltipIndicators: [1],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              width: 15,
              toY: widget.postCountData!.categories[2].userPostCount.toDouble(),
              color: Colors.purple,
            )
          ],
          showingTooltipIndicators: [1],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(1),
              width: 15,
              toY: widget.postCountData!.categories[4].userPostCount.toDouble(),
              color: Colors.yellow,
            )
          ],
          showingTooltipIndicators: [1],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              width: 15,
              toY: widget.postCountData!.categories[3].userPostCount.toDouble(),
              color: Colors.red,
            )
          ],
          showingTooltipIndicators: [1],
        ),
      ];
}
