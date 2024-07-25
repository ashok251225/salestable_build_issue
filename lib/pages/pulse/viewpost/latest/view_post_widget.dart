// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/controllers/puls_post_controller.dart';
import 'package:salestable/core/forms/form_text_field.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/models/plus_post_response.dart';
import 'package:salestable/pages/pulse/viewpost/partials/comment_card.dart';
import 'package:salestable/controllers/pulse_comment_controller.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/page_header.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../../../../core/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../../core/flutter_flow/flutter_flow_util.dart';
import 'view_post_model.dart';

export 'view_post_model.dart';

class ViewPostWidget extends StatefulWidget {
  const ViewPostWidget(
      {super.key,
      required this.postId,
      required this.totalLikes,
      this.element});
  final String postId;

  final String totalLikes;

  final ListElement? element;
  @override
  _ViewPostWidgetState createState() => _ViewPostWidgetState();
}

class _ViewPostWidgetState extends State<ViewPostWidget> {
  late ViewPostModel _model;
  late Future<void> _futureData;
  IconData likeIcon = Icons.thumb_up_outlined;
  bool notTappedlike = true;
  final PulsePostController pulsePostController =
      Get.put(PulsePostController());
  final CommentsController controller = Get.put(CommentsController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPostModel());
    _futureData = fetchData();
    _model.commentTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> fetchData() async {
    await fetchCommentsData();
  }

  // Assuming you have a method to fetch comments data
  Future<void> fetchCommentsData() async {
    // Fetch comments data from API or wherever you get it
    final comments = await _model.fetchviewpost(postId: widget.postId);

    // Set comments data to the controller
    controller.setCommentsData(comments);
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
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: FutureBuilder(
                  future: _futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: LoadingAll(),
                      );
                    } else if (snapshot.hasError) {
                      return SnapshotErrorHandler(snapshot: snapshot);
                    } else {
                      return Stack(
                        alignment: const AlignmentDirectional(0, 1),
                        children: [
                          const PageHeader(
                            pageTitle: 'Pulse',
                            hasBack: true,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 62, 0, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                alignment: const AlignmentDirectional(0, -1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 12, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.1,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.06,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                ImageComponent(
                                                              hasData: widget
                                                                  .element!
                                                                  .user
                                                                  .profilePic
                                                                  .isNotEmpty,
                                                              imageUrl: widget
                                                                  .element!
                                                                  .user
                                                                  .profilePic,
                                                            )),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 6.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${widget.element!.user.firstName} ${widget.element!.user.lastName}",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall,
                                                                ),
                                                                Text(
                                                                  Support.formatTimeAgo(widget
                                                                      .element!
                                                                      .updatedAt),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ].divide(
                                                                  const SizedBox(
                                                                      height:
                                                                          2)),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 8)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            8, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border: Border.all(
                                                              color: Color(int
                                                                  .tryParse(widget
                                                                      .element!
                                                                      .category
                                                                      .colorCode
                                                                      .replaceAll(
                                                                          '#',
                                                                          '0xFF'))!),
                                                              width: 1,
                                                            ),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10,
                                                                    4,
                                                                    10,
                                                                    4),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      widget
                                                                          .element!
                                                                          .category
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            color:
                                                                                Color(int.tryParse(widget.element!.category.colorCode.replaceAll('#', '0xFF'))!),
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            lineHeight:
                                                                                1,
                                                                          ),
                                                                    ),
                                                                    SvgPicture
                                                                        .network(
                                                                      widget
                                                                          .element!
                                                                          .category
                                                                          .pictureIcon,
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                    ),
                                                                  ].divide(
                                                                    const SizedBox(
                                                                        width:
                                                                            8),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 4)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 14, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: HtmlWidget(
                                                        widget.element!.post,
                                                        onTapUrl: (url) async {
                                                          await (launchURL(
                                                              url));
                                                          return true;
                                                        },
                                                        customWidgetBuilder:
                                                            (element) {
                                                          if (element.localName ==
                                                                  'img' &&
                                                              element.attributes
                                                                  .containsKey(
                                                                      'src')) {
                                                            final src = element
                                                                    .attributes[
                                                                'src'];
                                                            if (src != null &&
                                                                src.startsWith(
                                                                    'data:image')) {
                                                              return Image
                                                                  .memory(
                                                                base64.decode(
                                                                    src
                                                                        .split(
                                                                            ',')
                                                                        .last),
                                                              );
                                                            }
                                                          }
                                                          return null;
                                                        },
                                                        enableCaching: true,
                                                        onErrorBuilder: (context,
                                                                element,
                                                                error) =>
                                                            const Text(
                                                                'Unable to load'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 16, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0, 0),
                                                          child: Stack(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0, 0),
                                                            children: [
                                                              Row(
                                                                  children: [
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD0EDFF),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            4),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .thumb_up,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).gradientColor1,
                                                                          size:
                                                                              16,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                    "${widget.element!.likeCount}"),
                                                              ].divide(const SizedBox(
                                                                      width:
                                                                          8))),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            widget.element!
                                                                        .totalComments >
                                                                    1
                                                                ? '${widget.element!.totalComments} Comments'
                                                                : '${widget.element!.totalComments} Comment',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall,
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                height: 24,
                                                thickness: 1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dividerColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              // Row(
                                              //   mainAxisSize: MainAxisSize.max,
                                              //   children: [
                                              //     GestureDetector(
                                              //         child: Icon(
                                              //           likeIcon,
                                              //           color: FlutterFlowTheme.of(
                                              //                   context)
                                              //               .primary,
                                              //           size: 20,
                                              //         ),
                                              //         onTap: () {
                                              //           if (widget.element
                                              //                   .likeCount !=
                                              //               widget.totalLikes) {
                                              //             if (notTappedlike) {
                                              //               _model.addReaction(
                                              //                   reactionType:
                                              //                       "like",
                                              //                   postId:
                                              //                       widget.postId);
                                              //               setState(() {
                                              //                 widget.element
                                              //                     .likeCount++;
                                              //                 likeIcon = Icons
                                              //                     .thumb_up_alt_rounded;
                                              //                 notTappedlike = false;
                                              //               });
                                              //             } else {
                                              //               setState(() {
                                              //                 widget.element
                                              //                     .likeCount--;
                                              //                 likeIcon = Icons
                                              //                     .thumb_up_outlined;
                                              //                 notTappedlike = true;
                                              //               });
                                              //             }
                                              //           }
                                              //         }),
                                              //     Text(
                                              //       'Like',
                                              //       style:
                                              //           FlutterFlowTheme.of(context)
                                              //               .bodyMedium,
                                              //     ),
                                              //   ].divide(SizedBox(width: 4)),
                                              // ),
                                              // Row(
                                              //   mainAxisSize: MainAxisSize.max,
                                              //   children: [
                                              //     Icon(
                                              //       Icons.mode_comment_outlined,
                                              //       color:
                                              //           FlutterFlowTheme.of(context)
                                              //               .secondaryText,
                                              //       size: 16,
                                              //     ),
                                              //     Text(
                                              //       'Comment',
                                              //       style:
                                              //           FlutterFlowTheme.of(context)
                                              //               .bodyMedium,
                                              //     ),
                                              //   ].divide(SizedBox(width: 4)),
                                              // ),
                                            ]),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 16, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Comments',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 16, 0, 100),
                                          child: Obx(() {
                                            if (controller
                                                .commentsData.isNotEmpty) {
                                              return ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: controller
                                                    .commentsData.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final comment = controller
                                                      .commentsData[index];

                                                  return CommentCard(
                                                      comment: comment);
                                                },
                                              );
                                            } else {
                                              return Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 50.0),
                                                  child: Column(
                                                    children: [
                                                      Opacity(
                                                        opacity: 0.5,
                                                        child: SvgPicture.asset(
                                                          "assets/images/no_comments.svg",
                                                          // ignore: deprecated_member_use
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gradientColor1,
                                                          height: 50,
                                                          width: 50,
                                                        ),
                                                      ),
                                                      const Text(
                                                          "Be the first to comment"),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              width: double.infinity,
                              height: 85,
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
                                    12, 14, 12, 20),
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
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 12,
                                                    ),
                                                    child: SizedBox(
                                                      height: 48,
                                                      child: FormTextField(
                                                        textInputType: TextInputType.text,
                                                      
                                                        controller: _model
                                                            .commentTextController!,
                                                        borderRadius: 8,
                                                        hasDigitsonly: false,
                                                        labeltext:
                                                            "Write a comment",
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                                showLoadingIndicator: true,
                                                borderRadius: 12,
                                                fillColor: FlutterFlowTheme.of(context).addPost,
                                                borderWidth: 20,
                                                buttonSize: 35,
                                                icon: const Icon(
                                                  Icons.send,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                onPressed: () async {
                                                  await addComment();
                                                }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ),
          ),
        ));
  }

  Future<void> addComment() async {
    if (_model.commentTextController.text.trim().isEmpty) {
      return;
    }
    await _model.addCommentToPost(
        postId: widget.postId,
        comment: _model.commentTextController.text.trim());
    setState(() {});
    await fetchCommentsData();

    setState(() {
      widget.element!.totalComments++;
      pulsePostController.updateCommentsCount();
    });

    _model.commentTextController.text = "";
  }
}
