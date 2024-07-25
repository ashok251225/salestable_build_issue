// TODO Implement this library.
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:salestable/models/get_list_all_modules_response.dart';
import 'package:salestable/pages/training/index_screen/index_page_widget.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'upcoming_training_card_model.dart';
export 'upcoming_training_card_model.dart';

class UpcomingTrainingCardWidget extends StatefulWidget {
  const UpcomingTrainingCardWidget({super.key, required this.modulesData});
  final ListElement modulesData;

  @override
  State<UpcomingTrainingCardWidget> createState() =>
      _UpcomingTrainingCardWidgetState();
}

class _UpcomingTrainingCardWidgetState
    extends State<UpcomingTrainingCardWidget> {
  late UpcomingTrainingCardModel _model;

  num estimatedDuration = 0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingTrainingCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (var eachitem in widget.modulesData.contents) {
      estimatedDuration = estimatedDuration + eachitem.suggestDuration;
    }

    int estimatedDurationInMinutes = estimatedDuration ~/ 60;
    return GestureDetector(
      onTap: () {
        String moduleId = widget.modulesData.uuid;
        GetHelper.setModuleId(moduleId);
        Get.to(const IndexWidget());
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDAEFFF), Color(0xFFE0EAFC)],
            stops: [0, 1],
            begin: AlignmentDirectional(1, 0),
            end: AlignmentDirectional(-1, 0),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          border: Border.all(
            color: Color(0x000FFFFF),
            width: 1,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional(1, -1),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(14, 16, 14, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${widget.modulesData.title}',
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          '${widget.modulesData.description}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Generated code for this Row Widget...
                      Expanded(
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Content_upcoming.svg',
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      '${widget.modulesData.contentCount} Contents',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFF0494FD),
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 2)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: Color(0xFF455A64),
                                      size: 10,
                                    ),
                                    Text(
                                      '${estimatedDurationInMinutes} Min',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFF455A64),
                                            fontSize: 12,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 3)),
                                ),
                              ].divide(SizedBox(width: 8)))),

                      Container(
                        decoration: BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: SvgPicture.asset(
                            'assets/images/Training_Image.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 4)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4B6CFE), Color(0xFF0052D4)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                child: Text(
                  'Upcoming',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        color: Colors.white,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodySmallFamily),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
