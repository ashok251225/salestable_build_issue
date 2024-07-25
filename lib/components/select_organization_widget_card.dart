// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/select_organization_model_card.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/models/user_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';

class SelectOrganizationCardWidget extends StatefulWidget {
  const SelectOrganizationCardWidget({super.key, required this.OrgData});
  final Organisation OrgData;

  @override
  _SelectOrganizationCardWidgetState createState() =>
      _SelectOrganizationCardWidgetState();
}

class _SelectOrganizationCardWidgetState
    extends State<SelectOrganizationCardWidget> {
  late SelectOrganizationCardModel _model;
  bool isLoading = false;

  Future<void> fetchSelectOrg() async {
    setState(() {
      isLoading = true;
    });

    GetHelper.setOrgLogo(widget.OrgData.logo!);
    GetHelper.setOrgName(widget.OrgData.name!);

    await _model.selectOrganization(orgId: widget.OrgData.slug);
    setState(() {
      isLoading = false;
    });

    if (_model.statusCode == 200) {
      successSnackBar(_model.message);

      Get.toNamed(Routes.dashboard);
    } else if (_model.statusCode == 1001) {
      errorSnackBar(_model.message);
      Get.toNamed(Routes.login);

      return;
    } else {
      errorSnackBar(_model.message);
      Get.toNamed(Routes.login);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectOrganizationCardModel());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              Support.hasInternet(child: fetchSelectOrg());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).trainingCardBorder,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CachedNetworkImage(
                          imageUrl: widget.OrgData.logo!,
                          width: 54.0,
                          height: 48.0,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 62.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.OrgData.name ?? '',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            "${widget.OrgData.membersCount.toString()} Members",
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).smallText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                    isLoading
                        ? CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).gradientColor1,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.angleRight,
                                color: FlutterFlowTheme.of(context).iconColor,
                                size: 24.0,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
