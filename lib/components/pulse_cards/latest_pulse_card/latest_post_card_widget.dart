// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/controllers/puls_post_controller.dart';
import 'package:salestable/controllers/pulse_controller.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/models/plus_post_response.dart';
import 'package:salestable/pages/pulse/viewpost/latest/view_post_widget.dart';
import 'package:salestable/core/shared/delete_popup.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'latest_post_card_model.dart';

export 'latest_post_card_model.dart';

class LatestPostCardWidget extends StatefulWidget {
  const LatestPostCardWidget({
    super.key,
    required this.element,
    required this.postId,
  });
  final ListElement element;
  final String postId;

  @override
  _LatestPostCardWidgetState createState() => _LatestPostCardWidgetState();
}

class _LatestPostCardWidgetState extends State<LatestPostCardWidget> {
  late LatestPostCardModel _model;
  IconData cheerIcon = Icons.waving_hand_outlined;
  bool notTappedCheer = true;
  // String likeIcon = 'assets/images/like.svg';
  bool notTappedlike = true;
  IconData loveIcon = Icons.favorite_border;
  bool notTappedlove = true;
  final PulseController _pulseController = Get.put(PulseController());

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestPostCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  final PulsePostController pulsePostController =
      Get.put(PulsePostController());

  @override
  Widget build(BuildContext context) {
    String colors = widget.element.category.colorCode.replaceAll('#', '0xFF');
    String userName = (widget.element.user.firstName ==
                GetHelper.getUserFirstName() &&
            widget.element.user.lastName == GetHelper.getUserLastName())
        ? "${widget.element.user.firstName}(You)"
        : "${widget.element.user.firstName} ${widget.element.user.lastName}";

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.06,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ImageComponent(
                          hasData: widget.element.user.profilePic.isNotEmpty,
                          imageUrl: widget.element.user.profilePic,
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            Text(
                              Support.formatTimeAgo(
                                widget.element.updatedAt,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(height: 4.0)),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: Color(int.parse(colors)),
                          width: 1.0,
                        ),
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 4.0, 10.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.element.category.name,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: Color(int.parse(colors)),
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                    lineHeight: 1.0,
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.network(
                              widget.element.category.pictureIcon,
                              width: 16.0,
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.element.user.firstName ==
                                GetHelper.getUserFirstName() &&
                            widget.element.user.lastName ==
                                GetHelper.getUserLastName()
                        ? PopupMenuButton(
                            icon: const Icon(
                              Icons.more_vert,
                              size: 22,
                            ),
                            surfaceTintColor: Colors.white,
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: "delete",
                                    height: 25,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Delete',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                            onSelected: (String value) async {
                              if (value == 'delete') {
                                await showDialog(
                                  context: context,
                                  builder: (_) {
                                    return DeleteConfirmation(
                                      field: "Post",
                                      content:
                                          "This Post will be deleted permanently",
                                      onConfirm: () async {
                                        _pulseController.updatePageValue(1);

                                        await _model.deletePost(
                                            postId: widget.postId);
                                        Support().clearPulseFilters();

                                        setState(() {});
                                        if (_model.statusCode == 200) {
                                          successSnackBar(
                                              'You have successfully deleted a post!');
                                          Navigator.pushNamed(
                                              context, '/pulse');
                                          // Get.toNamed(Routes.pulse);
                                        }
                                        if (_model.statusCode != 200) {
                                          errorSnackBar(_model.message);
                                          return;
                                        }
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            position: PopupMenuPosition.under)
                        : Container(),
                  ].divide(const SizedBox(width: 4.0)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: HtmlWidget(
                    widget.element.post,
                    onTapUrl: (url) async {
                      await (launchURL(url));
                      return true;
                    },
                    customWidgetBuilder: (element) {
                      if (element.localName == 'img' &&
                          element.attributes.containsKey('src')) {
                        final src = element.attributes['src'];
                        if (src != null && src.startsWith('data:image')) {
                          return Image.memory(
                            base64.decode(src.split(',').last),
                          );
                        }
                      }
                      return null;
                    },
                    enableCaching: true,
                    onErrorBuilder: (context, element, error) =>
                        const Text('Unable to load'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ViewPostWidget(
                            postId: widget.postId,
                            element: widget.element,
                            totalLikes: widget.element.likeCount.toString(),
                          );
                        }));
                      },
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SvgPicture.asset(
                              'assets/images/comment.svg',
                              fit: BoxFit.cover,
                              height: 22,
                              width: 22,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            GetBuilder<PulsePostController>(
                              builder: (pulsePostController) => Text(
                                widget.element.totalComments.toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Align(
                    //       alignment: AlignmentDirectional(0.0, 0.0),
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(4.0),
                    //         ),
                    //         child: Align(
                    //           alignment: AlignmentDirectional(0.0, 0.0),
                    //           child: Padding(
                    //             padding: EdgeInsetsDirectional.fromSTEB(
                    //                 0.0, 0.0, 8.0, 0.0),
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.max,
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 GestureDetector(
                    //                     child: Icon(
                    //                       cheerIcon,
                    //                       color: FlutterFlowTheme.of(context)
                    //                           .tertiary,
                    //                       size: 20,
                    //                     ),
                    //                     onTap: () {
                    //                       if (notTappedCheer) {
                    //                         _model.addReaction(
                    //                             reactionType: "cheer",
                    //                             postId: widget.postId);
                    //                         setState(() {
                    //                           widget.element.cheerCount++;
                    //                           cheerIcon =
                    //                               Icons.waving_hand_rounded;
                    //                           notTappedCheer = false;
                    //                         });
                    //                       } else {
                    //                         setState(() {
                    //                           widget.element.cheerCount--;
                    //                           cheerIcon =
                    //                               Icons.waving_hand_outlined;
                    //                           notTappedCheer = true;
                    //                         });
                    //                       }
                    //                     }),
                    //                 Text(
                    //                   widget.element.cheerCount.toString(),
                    //                   style: FlutterFlowTheme.of(context)
                    //                       .bodyMedium,
                    //                 ),
                    //               ].divide(SizedBox(width: 5.0)),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (notTappedlike &&
                                            widget.element.activeReacition !=
                                                "like") {
                                          _model.addReaction(
                                            reactionType: "like",
                                            postId: widget.postId,
                                          );
                                          setState(() {
                                            widget.element.likeCount++;
                                            notTappedlike = false;
                                          });
                                        } else {
                                          if (widget.element.activeReacition ==
                                              "like") {
                                            setState(() {
                                              notTappedlike = true;
                                            });
                                          }
                                        }
                                      },
                                      child: SvgPicture.asset(
                                        notTappedlike &&
                                                widget.element
                                                        .activeReacition !=
                                                    "like"
                                            ? 'assets/images/like.svg'
                                            : 'assets/images/like_filled.svg',
                                        height: 22,
                                        width: 22,
                                      ),
                                    ),
                                    Text(
                                      widget.element.likeCount > 0
                                          ? widget.element.likeCount.toString()
                                          : '',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ].divide(const SizedBox(width: 5.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Align(
                    //       alignment: AlignmentDirectional(0.0, 0.0),
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(4.0),
                    //         ),
                    //         child: Align(
                    //           alignment: AlignmentDirectional(0.0, 0.0),
                    //           child: Padding(
                    //             padding: EdgeInsetsDirectional.fromSTEB(
                    //                 0.0, 0.0, 8.0, 0.0),
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.max,
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 GestureDetector(
                    //                   child: Icon(
                    //                     loveIcon,
                    //                     color: FlutterFlowTheme.of(context)
                    //                         .accent3,
                    //                     size: 20,
                    //                   ),
                    //                   onTap: () {
                    //                     if (notTappedlove) {
                    //                       _model.addReaction(
                    //                           reactionType: "love",
                    //                           postId: widget.postId);
                    //                       setState(() {
                    //                         widget.element.loveCount++;
                    //                         loveIcon = Icons.favorite_rounded;

                    //                         notTappedlove = false;
                    //                       });
                    //                     } else {
                    //                       setState(() {
                    //                         widget.element.loveCount--;
                    //                         loveIcon = Icons.favorite_border;
                    //                         notTappedlove = true;
                    //                       });
                    //                     }
                    //                   },
                    //                 ),
                    //                 Text(
                    //                   widget.element.loveCount.toString(),
                    //                   style: FlutterFlowTheme.of(context)
                    //                       .bodyMedium,
                    //                 ),
                    //               ].divide(SizedBox(width: 5.0)),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ],
            ),
          ),
          Divider(
              height: 32.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).dividerColor),
        ],
      ),
    );
  }
}
