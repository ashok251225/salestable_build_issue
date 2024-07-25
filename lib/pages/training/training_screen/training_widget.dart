// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:salestable/components/training/in_progress_card_widget2.dart';
import 'package:salestable/components/training/upcoming_training_card_widget2.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import '../../../components/training/in_progress_card_widget.dart';
import '../../../components/training/upcoming_training_card_widget.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'training_model.dart';
export 'training_model.dart';

class TrainingWidget extends StatefulWidget {
  const TrainingWidget({super.key});

  @override
  State<TrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends State<TrainingWidget> {
  late TrainingModel _model;
  late Future<void> _modelFuture;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedFilter = 'Recently Accessed';
  bool isInProgressNotEmpty = false;
  bool isCompletedNotEmpty = false;
  bool isYetToStartNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingModel());
    _modelFuture = fetchData();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _refreshData() async {
    setState(() {
      _modelFuture = fetchData();
    });
  }

  Future<void> fetchData() async {
    await _model.fetchAllModules();
    await _model.fetchRecentModules();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: const BottomNavigation(activeIndex: 3),
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: RefreshIndicator(
            onRefresh: _refreshData,
            child: Stack(
              alignment: const AlignmentDirectional(0, 0),
              children: [
                FutureBuilder<void>(
                  future: _modelFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingAll();
                    } else if (snapshot.hasError) {
                      return SnapshotErrorHandler(snapshot: snapshot);
                    } else {
                      // Assuming your Row and other widgets are here
                      if (_model.modulesData != null &&
                          _model.modulesData.list != null) {
                        for (var module in _model.modulesData.list) {
                          if (module.completedCount >= 1 &&
                              !module.isCompleted) {
                            isInProgressNotEmpty = true;
                          } else if (module.isCompleted) {
                            isCompletedNotEmpty = true;
                          } else if (module.completedCount == 0) {
                            isYetToStartNotEmpty = true;
                          }
                        }
                      }
                      int completedModulesCount = 0;
                      String displayText = selectedFilter;
                      int totalModulesCount =
                          _model.modulesData.totalPublishedModules;
                      completedModulesCount = _model.modulesData.completedCount;

                      return SingleChildScrollView(
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
                                      child: Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                              FlutterFlowTheme.of(context)
                                                  .accent2
                                            ],
                                            stops: const [0, 1],
                                            begin: const AlignmentDirectional(
                                                0, -1),
                                            end: const AlignmentDirectional(
                                                0, 1),
                                          ),
                                        ),
                                        child: Stack(
                                          alignment:
                                              const AlignmentDirectional(1, -1),
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: SvgPicture.asset(
                                                'assets/images/Logo_(9).svg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            // Generated code for this Column Widget...
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons
                                                              .arrow_back_sharp,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        onPressed: () {
                                                          // Add navigation logic here
                                                          Navigator.of(context)
                                                              .pop(); // This will pop the current route off the navigator and go back
                                                        },
                                                      ),
                                                      Text(
                                                        'Training',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge,
                                                      ),
                                                      // Icon(
                                                      //   Icons.info_outlined,
                                                      //   color: Colors.white,
                                                      //   size: 20,
                                                      // ),
                                                      Text(
                                                        '          ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          LinearPercentIndicator(
                                                            percent:
                                                                completedModulesCount /
                                                                    totalModulesCount,
                                                            width: 120,
                                                            lineHeight: 6,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                const Color(
                                                                    0xFF16E89C),
                                                            backgroundColor:
                                                                Colors.white,
                                                            barRadius:
                                                                const Radius
                                                                    .circular(
                                                                    6),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '$completedModulesCount/$totalModulesCount',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
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
                                                                  color: const Color(
                                                                      0xFFF6F6F6),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4)),
                                                      ),
                                                    ].divide(const SizedBox(
                                                        width: 8)),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 5)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, -1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(0, -1),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 6, 12, 0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                displayText,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Nunito',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Nunito'),
                                                    ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: InkWell(
                                                    onTap: () {
                                                      _showFilterBottomSheet(
                                                          context);
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .sortAmountUp,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          selectedFilter == "Recently Accessed"
                                              ? _model.recentModulesData !=
                                                          null &&
                                                      _model.recentModulesData!
                                                          .isNotEmpty
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 8),
                                                      child: ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: _model
                                                            .recentModulesData!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          if (_model
                                                              .recentModulesData![
                                                                  index]
                                                              .isNew) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      8),
                                                              child: UpcomingTrainingCardWidget2(
                                                                  modulesData:
                                                                      _model.recentModulesData![
                                                                          index]),
                                                            );
                                                          } else {
                                                            if (_model
                                                                .modulesData
                                                                .list[index]
                                                                .isCompleted) {
                                                              completedModulesCount++;
                                                            }
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      8),
                                                              child: InProgressCardWidget2(
                                                                  modulesData:
                                                                      _model.recentModulesData![
                                                                          index]),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    )
                                                  : Container(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 50, 0, 0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/No_training.svg',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            "No recently accessed items",
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  color: Colors
                                                                      .black,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito'),
                                                                  fontSize: 18,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                              : selectedFilter == 'In Progress'
                                                  ? isInProgressNotEmpty
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 0, 8),
                                                          child:
                                                              ListView.builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: _model
                                                                .modulesData
                                                                .list
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              if (_model
                                                                          .modulesData
                                                                          .list[
                                                                              index]
                                                                          .completedCount >=
                                                                      1 &&
                                                                  _model
                                                                          .modulesData
                                                                          .list[
                                                                              index]
                                                                          .isCompleted ==
                                                                      false) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                                  child: InProgressCardWidget(
                                                                      modulesData: _model
                                                                          .modulesData
                                                                          .list[index]),
                                                                );
                                                              }
                                                              return const SizedBox();
                                                            },
                                                          ),
                                                        )
                                                      : Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 50, 0, 0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/No_training.svg',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 16),
                                                              Text(
                                                                "No items are in progress.",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nunito',
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Nunito'),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                  : selectedFilter ==
                                                          'Completed'
                                                      ? isCompletedNotEmpty
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      8),
                                                              child: ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount: _model
                                                                    .modulesData
                                                                    .list
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  if (_model
                                                                      .modulesData
                                                                      .list[
                                                                          index]
                                                                      .isCompleted) {
                                                                    return Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                                      child: InProgressCardWidget(
                                                                          modulesData: _model
                                                                              .modulesData
                                                                              .list[index]),
                                                                    );
                                                                  }
                                                                  return const SizedBox();
                                                                },
                                                              ),
                                                            )
                                                          : Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      50,
                                                                      0,
                                                                      0),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/No_training.svg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          16),
                                                                  Text(
                                                                    "No Completed items",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Nunito',
                                                                          color:
                                                                              Colors.black,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Nunito'),
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                      : selectedFilter ==
                                                              'Yet to Start'
                                                          ? isYetToStartNotEmpty
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          8),
                                                                  child: ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    physics:
                                                                        const NeverScrollableScrollPhysics(),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: _model
                                                                        .modulesData
                                                                        .list
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      if (_model
                                                                              .modulesData
                                                                              .list[index]
                                                                              .completedCount ==
                                                                          0) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets
                                                                              .fromLTRB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              8),
                                                                          child:
                                                                              UpcomingTrainingCardWidget(modulesData: _model.modulesData.list[index]),
                                                                        );
                                                                      }
                                                                      return const SizedBox();
                                                                    },
                                                                  ),
                                                                )
                                                              : Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          50,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/No_training.svg',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              16),
                                                                      Text(
                                                                        "No Upcoming items.",
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito',
                                                                              color: Colors.black,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito'),
                                                                              fontSize: 18,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                          : Container()
                                        ].divide(const SizedBox(height: 10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(
                'Recently Accessed',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito',
                      color: Colors.black,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito'),
                      fontSize: 15,
                    ),
              ),
              onTap: () {
                setState(() {
                  selectedFilter = 'Recently Accessed';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.hourglass_bottom),
              title: Text(
                'In Progress',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito',
                      color: Colors.black,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito'),
                      fontSize: 15,
                    ),
              ),
              onTap: () {
                setState(() {
                  selectedFilter = 'In Progress';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle),
              title: Text(
                'Completed',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito',
                      color: Colors.black,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito'),
                      fontSize: 15,
                    ),
              ),
              onTap: () {
                setState(() {
                  selectedFilter = 'Completed';
                });
                Navigator.pop(context);
              },
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.play_arrow),
                  title: Text(
                    'Yet to Start',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Colors.black,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito'),
                          fontSize: 15,
                        ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Yet to Start';
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
