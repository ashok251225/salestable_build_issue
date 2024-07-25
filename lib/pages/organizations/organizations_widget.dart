// ignore_for_file: library_private_types_in_public_api

import 'package:salestable/components/select_organization_widget_card.dart';
import 'package:salestable/pages/organizations/organizations_model.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizationsWidget extends StatefulWidget {
  const OrganizationsWidget({super.key});

  @override
  _OrganizationsWidgetState createState() => _OrganizationsWidgetState();
}

class _OrganizationsWidgetState extends State<OrganizationsWidget> {
  late OrganizationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganizationsModel());
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
      // ignore: deprecated_member_use
      child: PopScope(
        canPop: false,
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 36.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 32.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/Salestable_Logo.svg',
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 33.0,
                            fit: BoxFit.cover,
                            color: FlutterFlowTheme.of(context).gradientColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Welcome Back, ',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleSmallFamily,
                                        ),
                                      ),
                                ),
                                Text(
                                  " ${GetHelper.getUserFirstName()}"
                                  " ${GetHelper.getUserLastName()}",
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .gradientColor1,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(
                                          FlutterFlowTheme.of(context)
                                              .titleMediumFamily,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Select a company to work with',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontSize: 14,
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).smallText,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return SelectOrganizationCardWidget(
                            OrgData: GetHelper.getOrgList()[index],
                          );
                        },
                        itemCount: GetHelper.getOrgList().length,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/teams_page.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
