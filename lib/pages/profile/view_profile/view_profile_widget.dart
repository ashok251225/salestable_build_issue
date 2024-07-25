import 'package:get/get.dart';
import 'package:salestable/components/details_card.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/pages/profile/edit_profile/edit_profile_widget.dart';
import 'package:salestable/pages/profile/profile_widget.dart';
import 'package:salestable/pages/profile/view_profile/view_profile_model.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfileWidget extends StatefulWidget {
  const ViewProfileWidget({super.key});

  @override
  _ViewProfileWidgetState createState() => _ViewProfileWidgetState();
}

class _ViewProfileWidgetState extends State<ViewProfileWidget> {
  late ViewProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: const BottomNavigation(activeIndex: 4),
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24,
                      ),
                      onPressed: () => Get.toNamed(Routes.profile),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Get.toNamed(Routes.editprofile);
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  // ignore: deprecated_member_use
                                  FontAwesomeIcons.edit,
                                  color: FlutterFlowTheme.of(context).accent3,
                                  size: 20,
                                ),
                                Text(
                                  'Edit',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ].divide(const SizedBox(width: 4)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Basic Details',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      DetailsCard(
                        lable: 'First Name',
                        details: GetHelper.getUserFirstName(),
                      ),
                      DetailsCard(
                        lable: 'Last Name',
                        details: GetHelper.getUserLastName(),
                      ),
                      DetailsCard(
                        lable: 'Email Address',
                        details: GetHelper.getUserEmail(),
                      ),
                      DetailsCard(
                        lable: 'Time Zone',
                        details: GetHelper.getTimeZone(),
                      ),
                    ].divide(const SizedBox(height: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
