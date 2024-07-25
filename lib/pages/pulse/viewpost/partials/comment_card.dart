import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/models/viewpost_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final CommentData comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.06,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ImageComponent(
                        hasData: comment.user.profilePic.isNotEmpty,
                        imageUrl: comment.user.profilePic,
                      ))
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).cardBorder),
                              color: FlutterFlowTheme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            comment.user.firstName ==
                                                    GetHelper.getUserFirstName()
                                                ? 'You'
                                                : "${comment.user.firstName} ${comment.user.lastName}",
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gradientColor1,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeFamily),
                                                ),
                                          ),
                                          Text(
                                            Support.formatTimeAgo(
                                                comment.updatedAt),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 8)),
                                      ),
                                      // Row(
                                      //   mainAxisSize: MainAxisSize.max,
                                      //   children: [
                                      //     Icon(
                                      //       Icons.keyboard_control,
                                      //       color:
                                      //           FlutterFlowTheme.of(context)
                                      //               .secondaryText,
                                      //       size: 24,
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: HtmlWidget(
                                            comment.comment,
                                            onTapUrl: (url) async {
                                              await (launchURL(url));
                                              return true;
                                            },
                                            customWidgetBuilder: (element) {
                                              if (element.localName == 'img' &&
                                                  element.attributes
                                                      .containsKey('src')) {
                                                final src =
                                                    element.attributes['src'];
                                                if (src != null &&
                                                    src.startsWith(
                                                        'data:image')) {
                                                  return Image.memory(
                                                    base64.decode(
                                                        src.split(',').last),
                                                  );
                                                }
                                              }
                                              return null;
                                            },
                                            enableCaching: true,
                                            onErrorBuilder: (context, element,
                                                    error) =>
                                                const Text('Unable to load'),
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
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [
                        //     Icon(
                        //       Icons.thumb_up_outlined,
                        //       color: FlutterFlowTheme.of(context).primary,
                        //       size: 16,
                        //     ),
                        //     Text(
                        //       comment.likeCount.toString(),
                        //       style:
                        //           FlutterFlowTheme.of(context).bodyMedium,
                        //     ),
                        //   ].divide(SizedBox(width: 5)),
                        // ),
                        // Container(
                        //   width: 6,
                        //   height: 6,
                        //   decoration:
                        //       BoxDecoration(
                        //     color: Color(
                        //         0xFFA1BED2),
                        //     shape: BoxShape
                        //         .circle,
                        //   ),
                        // ),
                        // Container(
                        //   decoration:
                        //       BoxDecoration(),
                        //   child: Row(
                        //     mainAxisSize:
                        //         MainAxisSize
                        //             .max,
                        //     children: [
                        //       // Text(
                        //       //   '2 Replies',
                        //       //   style:
                        //       //       FlutterFlowTheme.of(context).bodySmall,
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                      ]),
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(width: 8)),
          ),
        ],
      ),
    );
  }
}
