// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/pages/pulse/viewpost/pinned/view_pinned_post_widget.dart';
import 'package:salestable/core/shared/delete_popup.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';
import '../../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../../models/pulse_pinnedpost_response.dart';
import 'pinned_post_card_model.dart';

export 'pinned_post_card_model.dart';

class PinnedPostCardWidget extends StatefulWidget {
  const PinnedPostCardWidget(
      {super.key, required this.nameElement, required this.postId});
  final ListPinnedElement nameElement;
  final String postId;

  @override
  _PinnedPostCardWidgetState createState() => _PinnedPostCardWidgetState();
}

class _PinnedPostCardWidgetState extends State<PinnedPostCardWidget> {
  late PinnedPostCardModel _model;
  // IconData likeIcon = Icons.thumb_up_outlined;
  bool notTappedlike = true;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinnedPostCardModel());
    setState(() {});
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String colors =
        widget.nameElement.category.colorCode.replaceAll('#', '0xFF');

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
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    alignment: const AlignmentDirectional(-2.0, 1.0),
                    children: [
                      Row(
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
                                hasData: widget
                                    .nameElement.user.profilePic.isNotEmpty,
                                imageUrl: widget.nameElement.user.profilePic,
                              )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.nameElement.user.firstName ==
                                                GetHelper.getUserFirstName() &&
                                            widget.nameElement.user.lastName ==
                                                GetHelper.getUserLastName()
                                        ? "${widget.nameElement.user.firstName}" +
                                            "(You)"
                                        : widget.nameElement.user.firstName
                                            .toString(),
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  Text(
                                    Support.formatTimeAgo(
                                        widget.nameElement.createdAt),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                      Align(
                        alignment: const AlignmentDirectional(-0.97, -0.3),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 14.0, 0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFD8D9),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.push_pin,
                                    color: FlutterFlowTheme.of(context).accent3,
                                    size: 8.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                          children: [
                            SmallStyleTitle(
                              text: widget.nameElement.category.name,
                              color: Color(int.parse(colors)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.network(
                              widget.nameElement.category.pictureIcon,
                              width: 16.0,
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.nameElement.user.firstName ==
                                GetHelper.getUserFirstName() &&
                            widget.nameElement.user.lastName ==
                                GetHelper.getUserLastName()
                        ? PopupMenuButton(
                            icon: const Icon(
                              Icons.more_vert,
                              size: 22,
                            ),
                            surfaceTintColor: Colors.white,
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  // PopupMenuItem<String>(
                                  //   value: "edit",
                                  //   height: 25,
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         'Update',
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .titleSmall,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // PopupMenuDivider(),
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
                                        await _model.deletePost(
                                            postId: widget.postId);
                                        Support().clearPulseFilters();
                                        setState(() {});
                                        if (_model.statusCode == 200) {
                                          successSnackBar(_model.message);
                                          Get.toNamed(Routes.pulse);
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
                    widget.nameElement.post,
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
                          return ViewPinnedPostWidget(
                            postId: widget.postId,
                            element: widget.nameElement,
                            totalLikes: widget.nameElement.likeCount.toString(),
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
                            Text(
                              widget.nameElement.totalComments.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                    // Padding(
                    //   padding:
                    //       EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Align(
                    //         alignment: AlignmentDirectional(0.0, 0.0),
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(4.0),
                    //           ),
                    //           child: Align(
                    //             alignment: AlignmentDirectional(0.0, 0.0),
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.max,
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 Icon(
                    //                   Icons.waving_hand_outlined,
                    //                   color:
                    //                       FlutterFlowTheme.of(context).tertiary,
                    //                   size: 20.0,
                    //                 ),
                    //                 Text(
                    //                   widget.nameElement.cheerCount.toString(),
                    //                   style: FlutterFlowTheme.of(context)
                    //                       .bodyMedium,
                    //                 ),
                    //               ].divide(SizedBox(width: 5.0)),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 8.0, 0.0),
                      child: Row(
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
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (notTappedlike &&
                                            widget.nameElement
                                                    .activeReacition !=
                                                "like") {
                                          _model.addReaction(
                                              reactionType: "like",
                                              postId: widget.postId);
                                          setState(() {
                                            widget.nameElement.likeCount++;
                                            notTappedlike = false;
                                          });
                                        } else {
                                          if (widget.nameElement
                                                  .activeReacition ==
                                              "like") {
                                            setState(() {
                                              notTappedlike = true;
                                            });
                                          }
                                        }
                                      },
                                      child: SvgPicture.asset(
                                        notTappedlike &&
                                                widget.nameElement
                                                        .activeReacition !=
                                                    "like"
                                            ? 'assets/images/like.svg'
                                            : 'assets/images/like_filled.svg',
                                        height: 22,
                                        width: 22,
                                      ),
                                    ),
                                    Text(
                                      widget.nameElement.likeCount > 0
                                          ? widget.nameElement.likeCount
                                              .toString()
                                          : '',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ].divide(const SizedBox(width: 5.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    //           child: Row(
                    //             mainAxisSize: MainAxisSize.max,
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: [
                    //               Icon(
                    //                 Icons.favorite_border,
                    //                 color: FlutterFlowTheme.of(context).accent3,
                    //                 size: 20.0,
                    //               ),
                    //               Text(
                    //                 widget.nameElement.loveCount.toString(),
                    //                 style:
                    //                     FlutterFlowTheme.of(context).bodyMedium,
                    //               ),
                    //             ].divide(SizedBox(width: 5.0)),
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
            color: FlutterFlowTheme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }
}
