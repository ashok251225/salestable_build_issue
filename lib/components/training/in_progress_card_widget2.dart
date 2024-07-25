import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:salestable/models/recent_modules_response.dart';
import 'package:salestable/pages/training/training_content/training_content_widget.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'in_progress_card_model.dart';
export 'in_progress_card_model.dart';

class InProgressCardWidget2 extends StatefulWidget {
  const InProgressCardWidget2({super.key, required this.modulesData});

  final RecentModulesData modulesData;

  @override
  State<InProgressCardWidget2> createState() => _InProgressCardWidgetState();
}

class _InProgressCardWidgetState extends State<InProgressCardWidget2> {
  late InProgressCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InProgressCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double completedPercentage =
        (widget.modulesData.completedCount / widget.modulesData.contentCount);

    String formattedPercentage = (completedPercentage * 100).toStringAsFixed(1);

    return GestureDetector(
      onTap: () {
        String contentModuleId = widget.modulesData.uuid;

        GetHelper.setModuleId(contentModuleId);
        Get.to(const TrainingProgressWidget());
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFDAEFFF), Color(0xFFE0EAFC)],
            stops: [0, 1],
            begin: AlignmentDirectional(1, 0),
            end: AlignmentDirectional(-1, 0),
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          border: Border.all(
            color: const Color(0x000FFFFF),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(14, 16, 14, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.modulesData.title,
                    style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      widget.modulesData.description,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
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
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$formattedPercentage% Completed',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ],
                            ),
                            LinearPercentIndicator(
                              percent: completedPercentage,
                              width: 167,
                              lineHeight: 6,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor: const Color(0xFF9BD4FE),
                              barRadius: const Radius.circular(6),
                              padding: EdgeInsets.zero,
                            ),
                          ].divide(const SizedBox(height: 4)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
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
            ].divide(const SizedBox(height: 4)),
          ),
        ),
      ),
    );
  }
}
