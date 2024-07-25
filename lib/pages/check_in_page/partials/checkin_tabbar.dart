import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/flutter_flow/flutter_flow_button_tabbar.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';

class CheckinTabBar extends StatelessWidget {
  const CheckinTabBar({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0),
      child: FlutterFlowButtonTabBar(
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
        borderWidth: 2,
        borderRadius: 30,
        elevation: 0,
        buttonMargin: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        padding: const EdgeInsets.all(6),
        tabs: const [
          Tab(
            text: 'Check In',
          ),
          Tab(
            text: 'Goals',
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
