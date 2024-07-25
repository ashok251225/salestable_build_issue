// ignore_for_file: await_only_futures, use_build_context_synchronously, unused_element

import 'dart:async';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:salestable/components/training/content_comment_card.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/controllers/module_comments_controller.dart';
import 'package:salestable/controllers/read_content_comments.dart';
import 'package:salestable/components/training/fixed_height_image.dart';
import 'package:salestable/controllers/training_mark_as_read_controller.dart';
import 'package:salestable/models/module_response_model.dart';
import 'package:salestable/pages/training/training_content/content_file_component.dart';
import 'package:salestable/pages/training/training_content/read_content_response.dart';
import 'package:salestable/pages/training/training_content/training_comment_card2.dart';
import 'package:salestable/pages/training/training_content/training_content_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../core/flutter_flow/flutter_flow_icon_button.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../core/shared/loading_for_all.dart';
import '../../../core/shared/page_header.dart';
import '../../../core/shared/get_storage/get_storage_helper.dart';
import '../../../core/shared/snackbars/error_snackbar.dart';
import '../../../core/shared/snackbars/success_snackbar.dart';

export 'package:salestable/pages/training/training_content/training_content_model.dart';

class TrainingProgressWidget extends StatefulWidget {
  const TrainingProgressWidget({super.key});

  @override
  State<TrainingProgressWidget> createState() => _TrainingProgressWidgetState();
}

class _TrainingProgressWidgetState extends State<TrainingProgressWidget> {
  late TrainingProgressModel _model;
  late Future<void> _modelFuture;

  int contentIndex = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late YoutubePlayerController _controller;
  final MarkAsReadController markAsReadController =
      Get.put(MarkAsReadController());
  final ReadContentCommentsController readContentCommentsController =
      Get.put(ReadContentCommentsController());

  final ModuleCommentsController moduleCommentsController =
      Get.put(ModuleCommentsController());

  late Timer _timer;
  int _elapsedSeconds = 1;
  String contentUrl = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingProgressModel());
    _modelFuture = fetchData();
    _model.commentTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  Future<void> commentAdd() async {
    List<UserCommentData> currentCommentsDataLocal =
        await _model.eachModuleContent!.contents[0].comments;

    moduleCommentsController.setCommentData(currentCommentsDataLocal);
  }

  Future<void> commentAddOtherThanIndexZero() async {
    List<CommentUser> currentComments = await _model.readContentData!.comments;

    readContentCommentsController.setCommentData(currentComments);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
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

  Future<void> fetchData() async {
    await _model.fetchEachModuleContent();
    if (contentIndex == 0) {
      List<UserCommentData> currentCommentsDataLocal =
          await _model.eachModuleContent!.contents[0].comments;

      moduleCommentsController.setCommentData(currentCommentsDataLocal);
    } else {
      List<CommentUser> currentComments =
          await _model.readContentData!.comments;

      readContentCommentsController.setCommentData(currentComments);
    }
  }

  @override
  void dispose() {
    _model.dispose();
    _timer.cancel();

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
                  if (isLoading) {
                    return LoadingAll();
                  } else {
                    // Loading indicator widget

                    GetHelper.setContentId(
                        _model.eachModuleContent!.contents[contentIndex].uuid);
                    DateTime dateTime = DateTime.parse(contentIndex == 0
                        ? '${_model.eachModuleContent!.contents[0].updatedAt}'
                        : '${_model.readContentData!.updatedAt}');
                    String formattedDate =
                        DateFormat('d MMM yyyy').format(dateTime);
                    // String contentImportance = contentIndex == 0
                    //     ? _model.eachModuleContent!.contents[0].isRequired
                    //         ? 'Required'
                    //         : 'Optional'
                    //     : _model.readContentData!.isRequired
                    //         ? 'Required'
                    //         : 'Optional';
                    num estimatedDurationInMins = contentIndex == 0
                        ? _model.eachModuleContent!.contents[0]
                                .suggestDuration /
                            60
                        : _model.readContentData!.suggestDuration / 60;

                    estimatedDurationInMins = estimatedDurationInMins.round();
                    contentUrl = contentIndex == 0
                        ? _model.eachModuleContent!.contents[0].content
                        : _model.readContentData!.content;

                    if (getContentType(contentUrl) == 'Stream') {
                      _controller = YoutubePlayerController(
                        params: const YoutubePlayerParams(
                          showControls: true,
                          mute: false,
                          showFullscreenButton: false,
                          loop: false,
                        ),
                      );

                      _controller.setFullScreenListener(
                        (isFullScreen) {
                          log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
                        },
                      );

                      _controller.loadVideoByUrl(
                          mediaContentUrl: contentIndex == 0
                              ? _model.eachModuleContent!.contents[0].content
                              : "${_model.readContentData!.content}");
                    }

                    return Stack(
                      children: [
                        PageHeader(
                          pageTitle:
                              '${contentIndex + 1}/${_model.eachModuleContent!.contentCount}',
                          hasBack: true,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 62, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0, -1),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 20, 12, 20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        _showContentBottomSheet(
                                                            context);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 12),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xFF4AB3FE),
                                                              width: 1),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              _model
                                                                  .eachModuleContent!
                                                                  .contents[
                                                                      contentIndex]
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: Color(
                                                                  0xFF4AB3FE),
                                                              size: 24,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Last Updated : ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Text(
                                                        formattedDate,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Est: $estimatedDurationInMins Min',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              // Generated code for this Container Widget...

                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  contentIndex == 0
                                                      ? _model
                                                              .eachModuleContent!
                                                              .contents[0]
                                                              .isRequired
                                                          ? Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x6CC3E7E7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        5,
                                                                        8,
                                                                        5,
                                                                        8),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .check_circle_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size: 18,
                                                                    ),
                                                                    Text(
                                                                      'Mandatory',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                const Color(0xFF8391A1),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ].divide(
                                                                      const SizedBox(
                                                                          width:
                                                                              4)),
                                                                ),
                                                              ),
                                                            )
                                                          : Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 1,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFFFF4DF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          12,
                                                                          6,
                                                                          12,
                                                                          6),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          SvgPicture
                                                                              .asset(
                                                                            'assets/images/Optional_content.svg',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                          Text(
                                                                            'Optional',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                          ),
                                                                        ].divide(const SizedBox(width: 8)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                      : _model.readContentData!
                                                              .isRequired
                                                          ? Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0x6CC3E7E7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        5,
                                                                        8,
                                                                        5,
                                                                        8),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .check_circle_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size: 18,
                                                                    ),
                                                                    Text(
                                                                      'Mandatory',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                const Color(0xFF8391A1),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ].divide(
                                                                      const SizedBox(
                                                                          width:
                                                                              4)),
                                                                ),
                                                              ),
                                                            )
                                                          : Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 1,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFFFF4DF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          12,
                                                                          6,
                                                                          12,
                                                                          6),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          SvgPicture
                                                                              .asset(
                                                                            'assets/images/Optional_content.svg',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                          Text(
                                                                            'Optional',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleSmall,
                                                                          ),
                                                                        ].divide(const SizedBox(width: 3)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                  contentIndex == 0
                                                      ? _model
                                                                  .eachModuleContent!
                                                                  .contents[0]
                                                                  .timeDuration ==
                                                              null
                                                          ? Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child: GetBuilder<
                                                                        MarkAsReadController>(
                                                                      builder:
                                                                          (markAsReadController) =>
                                                                              Checkbox(
                                                                        value: _model.checkboxValue ??
                                                                            false,
                                                                        onChanged:
                                                                            (bool?
                                                                                newValue) async {
                                                                          if (newValue !=
                                                                              null) {
                                                                            // setState(() =>
                                                                            //     _model.checkboxValue = newValue);
                                                                            if (newValue) {
                                                                              if ((!markAsReadController.isContentWatched || markAsReadController.isImgtWatched) && (_model.eachModuleContent!.contents[contentIndex].isRequired == true)) {
                                                                                errorSnackBar('Please go through the content to mark it as complete');
                                                                              }
                                                                              // Show the confirmation dialog when the checkbox is checked
                                                                              else {
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      title: const Text('Confirmation'),
                                                                                      content: const Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          // Text('Are you sure you want to mark as completed?'),
                                                                                          // SizedBox(height: 16),
                                                                                          // Text('Content suggested duration should be 110 minutes, not 0 minutes'),
                                                                                        ],
                                                                                      ),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pop(false);
                                                                                            setState(() => _model.checkboxValue = null);
                                                                                            // Close the dialog
                                                                                          },
                                                                                          child: Text(
                                                                                            'Cancel',
                                                                                            style: TextStyle(color: Colors.grey[800]),
                                                                                          ),
                                                                                        ),
                                                                                        ElevatedButton(
                                                                                          onPressed: () async {
                                                                                            await _model.markAsCompleted(timeDuration: _elapsedSeconds);

                                                                                            // Check the status code
                                                                                            if (_model.statusCode == 200) {
                                                                                              successSnackBar('${_model.message}');
                                                                                              Navigator.of(context).pop(true);
                                                                                            }
                                                                                          },
                                                                                          style: ButtonStyle(
                                                                                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                                                                                          ),
                                                                                          child: const Text(
                                                                                            'Mark as Completed',
                                                                                            style: TextStyle(color: Colors.white),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }
                                                                            }
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Mark As Completed',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                        color: Colors
                                                                            .black,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Nunito'),
                                                                      ),
                                                                ),
                                                              ],
                                                            )
                                                          : Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .check_box,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 18,
                                                                ),
                                                                Text(
                                                                  'Marked As Complete',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                        color: Colors
                                                                            .black,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Nunito'),
                                                                      ),
                                                                ),
                                                              ],
                                                            )
                                                      : _model.readContentData!
                                                                  .timeDuration ==
                                                              null
                                                          ? Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        visualDensity:
                                                                            VisualDensity.compact,
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize.shrinkWrap,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                    ),
                                                                    child: GetBuilder<
                                                                        MarkAsReadController>(
                                                                      builder:
                                                                          (markAsReadController) =>
                                                                              Checkbox(
                                                                        value: _model.checkboxValue ??
                                                                            false,
                                                                        onChanged:
                                                                            (bool?
                                                                                newValue) async {
                                                                          if (newValue !=
                                                                              null) {
                                                                            setState(() =>
                                                                                _model.checkboxValue = newValue);
                                                                            if (newValue) {
                                                                              if ((markAsReadController.isContentWatched || markAsReadController.isImgtWatched) && (_model.eachModuleContent!.contents[contentIndex].isRequired == true)) {
                                                                                errorSnackBar('Please go through the content to mark it as complete');
                                                                              }
                                                                              // Show the confirmation dialog when the checkbox is checked
                                                                              else {
                                                                                // Show the confirmation dialog when the checkbox is checked
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      title: const Text('Confirmation'),
                                                                                      content: const Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          // Text('Are you sure you want to mark as completed?'),
                                                                                          // SizedBox(height: 16),
                                                                                          // Text('Content suggested duration should be 110 minutes, not 0 minutes'),
                                                                                        ],
                                                                                      ),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pop();
                                                                                            setState(() => _model.checkboxValue = null); // Close the dialog
                                                                                          },
                                                                                          child: Text(
                                                                                            'Cancel',
                                                                                            style: TextStyle(color: Colors.grey[800]),
                                                                                          ),
                                                                                        ),
                                                                                        ElevatedButton(
                                                                                          onPressed: () async {
                                                                                            await _model.markAsCompleted(timeDuration: _elapsedSeconds);

                                                                                            // Check the status code
                                                                                            if (_model.statusCode == 200) {
                                                                                              // Show a snackbar if the status code is 200
                                                                                              successSnackBar('${_model.message}');
                                                                                              Navigator.of(context).pop();
                                                                                            }
                                                                                          },
                                                                                          style: ButtonStyle(
                                                                                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                                                                                          ),
                                                                                          child: const Text(
                                                                                            'Mark as Completed',
                                                                                            style: TextStyle(color: Colors.white),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }
                                                                            }
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Mark As Completed',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                        color: Colors
                                                                            .black,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Nunito'),
                                                                      ),
                                                                ),
                                                              ],
                                                            )
                                                          : Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .check_box,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 18,
                                                                ),
                                                                Text(
                                                                  'Marked As Complete',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                        color: Colors
                                                                            .black,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Nunito'),
                                                                      ),
                                                                ),
                                                              ],
                                                            )
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (getContentType(
                                                                          contentUrl) ==
                                                                      'Stream')
                                                                    YoutubePlayer(
                                                                      aspectRatio:
                                                                          16 /
                                                                              9,
                                                                      controller:
                                                                          _controller,
                                                                    )
                                                                  else
                                                                    getContentType(contentUrl) ==
                                                                            'Image'
                                                                        ? FixedHeightImage(
                                                                            contentUrl:
                                                                                contentUrl)
                                                                        : ContentFileWidget(
                                                                            contentUrl:
                                                                                contentUrl),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              contentIndex == 0
                                                                  ? _model
                                                                      .eachModuleContent!
                                                                      .contents[
                                                                          0]
                                                                      .name
                                                                  : '${_model.readContentData!.name}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    lineHeight:
                                                                        1.2,
                                                                  ),
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
                                                              contentIndex == 0
                                                                  ? _model
                                                                      .eachModuleContent!
                                                                      .contents[
                                                                          0]
                                                                      .description
                                                                  : '${_model.readContentData!.description ?? ''}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito',
                                                                    color: const Color(
                                                                        0xFF6B6B6B),
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Nunito'),
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(const SizedBox(
                                                        height: 4)),
                                                  ),
                                                ].divide(
                                                    const SizedBox(height: 10)),
                                              ),
                                            ].divide(
                                                const SizedBox(height: 12)),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFECF7FF),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      contentIndex == 0
                                                          ? '${_model.eachModuleContent!.contents[0].comments.length} Comments'
                                                          : '${_model.readContentData!.comments.length} Comments',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: Colors
                                                                    .black,
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
                                                  ],
                                                ),
                                              ),
                                              Obx(
                                                () => Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 16, 0, 100),
                                                  child: contentIndex == 0
                                                      ? moduleCommentsController
                                                              .commentsData
                                                              .isNotEmpty
                                                          ? ListView.builder(
                                                              physics:
                                                                  const NeverScrollableScrollPhysics(),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,

                                                              itemCount:
                                                                  moduleCommentsController
                                                                      .commentsData
                                                                      .length,
                                                              // Set the number of items in your list
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                if (index <
                                                                    moduleCommentsController
                                                                            .commentsData
                                                                            .length -
                                                                        1) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            15),
                                                                    child: ContentCommentCard(
                                                                        comment:
                                                                            moduleCommentsController.commentsData[index]),
                                                                  );
                                                                } else {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            80),
                                                                    child: ContentCommentCard(
                                                                        comment:
                                                                            moduleCommentsController.commentsData[index]),
                                                                  );
                                                                }
                                                              },
                                                            )
                                                          : Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            50.0),
                                                                child: Column(
                                                                  children: [
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        "assets/images/no_comments.svg",
                                                                        // ignore: deprecated_member_use
                                                                        color: const Color(
                                                                            0xFF0494FD),
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50,
                                                                      ),
                                                                    ),
                                                                    const Text(
                                                                        "Be the first to comment"),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                      : readContentCommentsController
                                                              .commentsData!
                                                              .isNotEmpty
                                                          ? ListView.builder(
                                                              physics:
                                                                  const NeverScrollableScrollPhysics(),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,

                                                              itemCount:
                                                                  readContentCommentsController
                                                                      .commentsData!
                                                                      .length,
                                                              // Set the number of items in your list
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                if (index <
                                                                    readContentCommentsController
                                                                            .commentsData!
                                                                            .length -
                                                                        1) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            15),
                                                                    child: ContentCommentCard2(
                                                                        comment:
                                                                            readContentCommentsController.commentsData![index]),
                                                                  );
                                                                } else {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            80),
                                                                    child: ContentCommentCard2(
                                                                        comment:
                                                                            readContentCommentsController.commentsData![index]),
                                                                  );
                                                                }
                                                              },
                                                            )
                                                          : Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            50.0),
                                                                child: Column(
                                                                  children: [
                                                                    Opacity(
                                                                      opacity:
                                                                          0.5,
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        "assets/images/no_comments.svg",
                                                                        // ignore: deprecated_member_use
                                                                        color: const Color(
                                                                            0xFF0494FD),
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50,
                                                                      ),
                                                                    ),
                                                                    const Text(
                                                                        "Be the first to comment"),
                                                                  ],
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

                                    //Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x15000000),
                                    offset: Offset(4, 0),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 14, 12, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.06,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ImageComponent(
                                                    hasData: GetHelper
                                                            .getProfilePic()
                                                        .isNotEmpty,
                                                    imageUrl: GetHelper
                                                        .getProfilePic(),
                                                  )),
                                              Expanded(
                                                child: Container(
                                                  height: 48,
                                                  decoration:
                                                      const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            12, 0, 12, 0),
                                                    child: TextFormField(
                                                      maxLines: 5,
                                                      controller: _model
                                                          .commentTextController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintText:
                                                            'Write a comment...',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              showLoadingIndicator: true,
                                              borderRadius: 8,
                                              borderWidth: 0,
                                              buttonSize: 42,
                                              icon: Icon(
                                                Icons.send,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                if (_model
                                                    .commentTextController.text
                                                    .trim()
                                                    .isEmpty) {
                                                  return;
                                                }
                                                if (contentIndex == 0) {
                                                  await _model.addComment(
                                                      commentData: _model
                                                          .commentTextController
                                                          .text
                                                          .trim());
                                                  setState(() {});
                                                  await _model
                                                      .fetchEachModuleContent();

                                                  List<UserCommentData>
                                                      currentCommentsDataLocal =
                                                      _model.eachModuleContent!
                                                          .contents[0].comments;

                                                  moduleCommentsController
                                                      .setCommentData(
                                                          currentCommentsDataLocal);

                                                  setState(() {});

                                                  _model.commentTextController
                                                      .text = "";
                                                } else {
                                                  await _model.addComment(
                                                      commentData: _model
                                                          .commentTextController
                                                          .text
                                                          .trim());
                                                  setState(() {});

                                                  await _model.readContent();

                                                  List<CommentUser>
                                                      currentComments = _model
                                                          .readContentData!
                                                          .comments;

                                                  readContentCommentsController
                                                      .setCommentData(
                                                          currentComments);

                                                  setState(() {});

                                                  _model.commentTextController
                                                      .text = "";
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }
              }),
        ),
      ),
    );
  }

  void _showContentBottomSheet(BuildContext context) {
    double sheetHeight = MediaQuery.of(context).size.height * 0.45;
    showModalBottomSheet(
      showDragHandle: false,
      useRootNavigator: true,
      useSafeArea: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: sheetHeight,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF0494FD),
            boxShadow: const [
              BoxShadow(
                blurRadius: 9,
                color: Color(0x1A000000),
                offset: Offset(0, -2),
              )
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            border: Border.all(
              color: const Color(0xFFDCDCDC),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _model.eachModuleContent!.contents.length,
                    itemBuilder: (context, index) {
                      final content = _model.eachModuleContent!.contents[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                Text(
                                  '${index + 1}.',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    content.name,
                                    style: const TextStyle(color: Colors.white),
                                    // style: FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.check_circle,
                              color: _model.eachModuleContent!.contents[index]
                                          .completedAt !=
                                      null
                                  ? const Color(0xFF14EB9D)
                                  : const Color.fromARGB(255, 194, 187, 187),
                              size: 17,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                isLoading = index != 0;
                              });

                              if (index != 0) {
                                _executeAfterBottomSheetClosed(content);
                              } else {
                                setState(() {
                                  contentIndex = 0;
                                  _model.dropDownValue = content.name;
                                  isLoading = false;
                                });
                              }
                            },
                          ),
                          if (index !=
                              _model.eachModuleContent!.contents.length - 1)
                            Divider(
                                thickness: 1,
                                color:
                                    FlutterFlowTheme.of(context).dividerColor),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _executeAfterBottomSheetClosed(Content content) async {
    GetHelper.setEachContentId(content.uuid);
    GetHelper.setContentId(content.uuid);

    await _model.readContent();

    if (_model.readContentData != null) {
      List<CommentUser> currentComments = _model.readContentData!.comments;
      readContentCommentsController.setCommentData(currentComments);
    } else {}

    setState(() {
      contentIndex = _model.eachModuleContent!.contents.indexOf(content);
      _model.dropDownValue = content.name;
      isLoading = false;
    });
  }
}
