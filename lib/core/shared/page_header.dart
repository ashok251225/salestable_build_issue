import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/notifications/notifications_count_widget.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/texts/large_style_title.dart';

class PageHeader extends StatefulWidget {
  const PageHeader({super.key, required this.pageTitle, this.hasBack = false});

  final String pageTitle;
  final bool hasBack;
  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1),
      child: SingleChildScrollView(
        child: Column(
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
                          FlutterFlowTheme.of(context).accent1,
                          FlutterFlowTheme.of(context).accent2
                        ],
                        stops: const [0, 1],
                        begin: const AlignmentDirectional(0, -1),
                        end: const AlignmentDirectional(0, 1),
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(1, -1),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(
                            'assets/images/Logo_(9).svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  widget.hasBack
                                      ? BackButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            Get.back();
                                            setState(() {});
                                          })
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          child: SvgPicture.asset(
                                            'assets/images/SalestableLogoMobile.svg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                  LargeStyleTitle(
                                      text: widget.pageTitle,
                                      color: FlutterFlowTheme.of(context)
                                          .regularTitleWhite),
                                  const NotificationsCountWidget(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
