import 'package:get/get.dart';
import 'package:salestable/controllers/training_mark_as_read_controller.dart';
import 'package:salestable/pages/training/training_content/content_file_component_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:salestable/pages/training/training_content/content_file_component_model.dart';

class ContentFileWidget extends StatefulWidget {
  ContentFileWidget({super.key, required this.contentUrl});

  final String contentUrl;

  @override
  State<ContentFileWidget> createState() => _ContentFileWidgetState();
}

class _ContentFileWidgetState extends State<ContentFileWidget> {
  late ContentFileWidgetModel _model;
  MarkAsReadController markAsReadController = Get.put(MarkAsReadController());

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentFileWidgetModel());
  }

  // REVIEW: remove deprecated methods
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.21,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          const BoxShadow(
            blurRadius: 9,
            color: Color(0x0D000000),
            offset: Offset(4, 4),
          )
        ],
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: const Color(0xFFEAEAEA),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: SvgPicture.asset(
                    'assets/images/training_content.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 18),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () {
                      _launchURL(widget.contentUrl);
                      markAsReadController.updateIsContentWatched(
                          true); // or false depending on your logic
                    },
                    text: 'Click To Go',
                    options: FFButtonOptions(
                      height: 36,
                      padding: const EdgeInsets.all(5),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ].divide(const SizedBox(height: 17)),
        ),
      ),
    );
  }
}
