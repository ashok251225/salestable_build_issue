import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import '../../../core/texts/large_style_title.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';

class EditCheckinHeader extends StatelessWidget {
  const EditCheckinHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).regularTitleWhite,
                    size: 24,
                  )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              LargeStyleTitle(
                text: 'Check In',
                color: FlutterFlowTheme.of(context).regularTitleWhite,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SmallStyleTitle(
                text: '            ',
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
