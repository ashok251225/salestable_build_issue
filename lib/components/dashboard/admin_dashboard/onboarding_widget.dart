// TODO Implement this library.
import 'package:salestable/models/onboarding_overview_response.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key, required this.onBoardingData});

  final OverViewData? onBoardingData;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalValue = widget.onBoardingData!.progress.onboardedUsersCount;
    final completedValue = widget.onBoardingData!.progress.completedUsersCount;
    final List<int> values = [
      widget.onBoardingData!.progress.completedUsersCount,
      widget.onBoardingData!.progress.inProgressUsersCount,
      widget.onBoardingData!.progress.yetToStartUsersCount
    ];

    final List<double> widths =
        values.map((value) => value / totalValue).toList();
    double completionPercentage = (completedValue / totalValue) * 100;
    completionPercentage =
        double.parse(completionPercentage.toStringAsFixed(2));

    return Container(
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
                  Text(
                    'Onboarding Overview',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          color: Color(0xFF090909),
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: (widths[0] * 100).toInt(),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF2DC38D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
                  flex: (widths[1] * 100).toInt(),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFEB9B42),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
                  flex: (widths[2] * 100).toInt(),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6CB5C),
                      borderRadius: BorderRadius.circular(8),
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${widget.onBoardingData!.progress.completedUsersCount}',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${widget.onBoardingData!.progress.inProgressUsersCount}',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Row(
                      children: [
                    Icon(
                      Icons.rectangle_rounded,
                      color: Color(0xFFF6CB6C),
                      size: 18,
                    ),
                    Text(
                      'Yet to start',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Color(0xFF6D8698),
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                    Text(
                      '${widget.onBoardingData!.progress.yetToStartUsersCount}',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Color(0xFF314A5E),
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                  ].divide(SizedBox(width: 10))),
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
                                      '${widget.onBoardingData!.progress.onboardedUsersCount}',
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
                                      'Total onboarded users',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFF494949),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
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
                                        '${completionPercentage}%',
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
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            showDragHandle: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return _buildModalSheet();
                                            },
                                          );
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  6), // Set border radius here
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        child: Text('View Details'),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 8)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 14)),
                ),

                //             Column(
                //               children: [
                //                 Row(children: [
                //                   Expanded(
                //                     child: Container(
                //                         padding: EdgeInsets.all(0),
                //                         decoration: BoxDecoration(
                //                           color: Color(0xFFE0F1FF),
                //                           borderRadius: BorderRadius.circular(4),
                //                         ),
                //                         child: Padding(
                //                           padding:
                //                               const EdgeInsets.only(left: 32.0, bottom: 32),
                //                           child: Column(
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         showModalBottomSheet(
                //           showDragHandle: true,
                //           context: context,
                //           builder: (BuildContext context) {
                //             return _buildModalSheet();
                //           },
                //         );
                //       },
                //       child: Text('View Details'),
                //     ),
                //   ],
                // ),
                //                         )),
                //                   )
                //                 ]),
                //               ],
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(top: 8.0),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                   color: Color(0xFFE0F1FF),
                //                   borderRadius: BorderRadius.circular(4),
                //                 ),
                //                 child: Padding(
                //                   padding:
                //                       const EdgeInsets.only(left: 32.0, top: 8, bottom: 8),
                //                   child: Row(
                //                       children: [
                //                     Text(
                //                       '${widget.onBoardingData!.totalSteps}',
                //                       style: FlutterFlowTheme.of(context).titleSmall,
                //                     ),
                //                     Text(
                //                       'Total modules available',
                //                       style: FlutterFlowTheme.of(context)
                //                           .bodyMedium
                //                           .override(
                //                             fontFamily: FlutterFlowTheme.of(context)
                //                                 .bodyMediumFamily,
                //                             color: Color(0xFF494949),
                //                             fontSize: 12,
                //                             fontWeight: FontWeight.w500,
                //                             useGoogleFonts: GoogleFonts.asMap().containsKey(
                //                                 FlutterFlowTheme.of(context)
                //                                     .bodyMediumFamily),
                //                           ),
                //                     ),
                //                   ].divide(SizedBox(
                //                     width: 8,
                //                   ))),
                //                 ),
                //               ),
                //             ),
              ],
            ),
          ].divide(SizedBox(height: 20)),
        ),
      ),
    );
  }

  Widget _buildModalSheet() {
    double modalSheetHeight = MediaQuery.of(context).size.height * 0.8;
    double listHeight =
        widget.onBoardingData!.progress.completedUser.length * 100.0;
    double maxHeight =
        listHeight > modalSheetHeight ? modalSheetHeight : listHeight;

    return Container(
      height: maxHeight,
      padding: EdgeInsets.fromLTRB(15, 3, 15, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Completed users:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 12.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.onBoardingData!.progress.completedUser.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: widget.onBoardingData!.progress
                                .completedUser[index].profilePic.isNotEmpty
                            ? Image.network(
                                widget.onBoardingData!.progress
                                    .completedUser[index].profilePic,
                                fit: BoxFit.cover,
                                height: 30,
                                width: 30,
                              )
                            : Image.network(
                                'https://picsum.photos/seed/952/600',
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Finished onboarding",
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
