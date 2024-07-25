import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_button_tabbar.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

class PulseTabbar extends StatelessWidget {
  final TabController controller;
  const PulseTabbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FlutterFlowButtonTabBar(
      useToggleButtonStyle: false,
      labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
            fontWeight: FontWeight.w500,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
          ),
      unselectedLabelStyle: const TextStyle(),
      labelColor: FlutterFlowTheme.of(context).tabText,
      unselectedLabelColor: FlutterFlowTheme.of(context).tabText,
      backgroundColor: FlutterFlowTheme.of(context).tabColor,
      unselectedBackgroundColor: FlutterFlowTheme.of(context).aTabColor,
      borderWidth: 2.0,
      borderRadius: 30.0,
      
      elevation: 0.0,
      buttonMargin: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      padding: const EdgeInsets.all(6.0),
      tabs: const [
        Tab(
          text: 'Latest Posts',
        ),
        Tab(
          text: 'Pinned Posts',
        ),
      ],
      controller: controller,
    );
  }
}
