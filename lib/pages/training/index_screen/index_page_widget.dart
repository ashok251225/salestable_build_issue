import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:salestable/pages/training/index_screen/index_page_model.dart';
import 'package:salestable/pages/training/training_content/training_content_widget.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:salestable/pages/training/index_screen/index_page_model.dart';

class IndexWidget extends StatefulWidget {
  const IndexWidget({
    super.key,
  });
  //final String moduleId; //REVIEW: Remove unused variables

  @override
  State<IndexWidget> createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {
  late IndexModel _model;
  late Future<void> _modelFuture;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndexModel());

    //REVIEW: use proper naming for variables
    // REVIEW: _modelFuture -> _trainingDataFuture
    _modelFuture = fetchData();
  }

  Future<void> fetchData() async {
    await _model.fetchEachModule();
  }

  String getContentType(String contentUrl) {
    if (contentUrl.startsWith('<iframe')) {
      return 'Stream';
    } else if (contentUrl.startsWith('https://www.youtube.com/watch')) {
      return 'YouTube';
    } else if (contentUrl.endsWith('.pdf')) {
      return 'PDF';
    } else if (contentUrl.endsWith('.ppt')) {
      return 'PPT';
    } else if (contentUrl.endsWith('.pptx')) {
      return 'PPTX';
    } else if (contentUrl.endsWith('.txt')) {
      return 'TXT';
    } else if (contentUrl.endsWith('.xls')) {
      return 'XLS';
    } else if (contentUrl.endsWith('.xlsx')) {
      return 'XLSX';
    } else if (contentUrl.endsWith('.htm') || contentUrl.endsWith('.html')) {
      return 'HTML';
    } else if (contentUrl.endsWith('.doc')) {
      return 'DOC';
    } else if (contentUrl.endsWith('.docx')) {
      return 'DOCX';
    } else if (contentUrl.endsWith('.eps')) {
      return 'EPS';
    } else if (contentUrl.endsWith('.psd')) {
      return 'PSD';
    } else if (contentUrl.endsWith('.png') ||
        contentUrl.endsWith('.jpg') ||
        contentUrl.endsWith('.jpeg') ||
        contentUrl.endsWith('.gif') ||
        contentUrl.endsWith('.svg')) {
      return 'Image';
    } else {
      return 'Unknown';
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: FutureBuilder(
                future:
                    _modelFuture, // Replace _fetchData with your asynchronous operation
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingAll();
                  } else if (snapshot.hasError) {
                    // If there's an error while fetching data, handle it here
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).accent1,
                                  FlutterFlowTheme.of(context).accent2
                                ],
                                stops: [0, 0.5],
                                begin: AlignmentDirectional(0.03, -1),
                                end: AlignmentDirectional(-0.03, 1),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1, -1),
                                  child: Stack(
                                    alignment: AlignmentDirectional(1, -1),
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 20, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 16),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        icon: Icon(
                                                          Icons.close_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 24,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Training',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Nunito'),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '             ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      6, 12, 6),
                                                          child: Text(
                                                            '${_model.eachModuleData!.title}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        '${_model.eachModuleData!.description}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                                fontFamily:
                                                                    'Nunito',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nunito'),
                                                                fontSize: 14),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Index',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 16)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.04, -0.18),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          child: SvgPicture.asset(
                                            'assets/images/Logo_(9).svg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 24, 16, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(16),
                                                              topRight: Radius
                                                                  .circular(16),
                                                            ),
                                                          ),
                                                          child:
                                                              ListView.builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: _model
                                                                .eachModuleData!
                                                                .contents
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            24),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: 29,
                                                                      height:
                                                                          29,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF0494FD),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          '${_model.eachModuleData!.contents[index].order}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        ' ${_model.eachModuleData!.contents[index].name}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito',
                                                                              color: Colors.black,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0),
                                                                      child: getContentType(_model.eachModuleData!.contents[index].content) == 'YouTube' ||
                                                                              getContentType(_model.eachModuleData!.contents[index].content) ==
                                                                                  'Stream'
                                                                          ? SvgPicture
                                                                              .asset(
                                                                              'assets/images/video_icon.svg',
                                                                              fit: BoxFit.cover,
                                                                            )
                                                                          : getContentType(_model.eachModuleData!.contents[index].content) == 'Image'
                                                                              ? SvgPicture.asset(
                                                                                  'assets/images/training_content_image.svg',
                                                                                  fit: BoxFit.cover,
                                                                                )
                                                                              : SvgPicture.asset(
                                                                                  'assets/images/training_content_file.svg',
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          )),
                                                    )
                                                  ],
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 32),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0xFF006DBC),
                                                                Color(
                                                                    0xFF0494FD)
                                                              ],
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      1, -1),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      -1, 1),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: FFButtonWidget(
                                                            //REVIEW: Onpresssd event method need to move to another method don't write logics code in UI code
                                                            onPressed: () {
                                                              String
                                                                  contentModuleId =
                                                                  _model
                                                                      .eachModuleData!
                                                                      .uuid;

                                                              GetHelper.setModuleId(
                                                                  contentModuleId);
                                                              Get.to(
                                                                  const TrainingProgressWidget());
                                                            },
                                                            text: 'Get Started',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              color: Color(
                                                                  0x000494FD),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ),
        ));
  }
}
