// ignore_for_file: library_private_types_in_public_api

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:salestable/components/edit_details_card.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  autofill() {
    _model.textfirstNameController.text = GetHelper.getUserFirstName();
    _model.textlastNameController.text = GetHelper.getUserLastName();
    _model.textEmailController.text = GetHelper.getUserEmail();
    _model.textTimeZoneController.text = GetHelper.getTimeZone();
    _model.textDesignationController.text = GetHelper.getDesignation();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());
    _model.textfirstNameController ??= TextEditingController();
    _model.textlastNameController ??= TextEditingController();
    _model.textEmailController ??= TextEditingController();
    _model.textTimeZoneController ??= TextEditingController();
    _model.textDesignationController ??= TextEditingController();

    _initializeConnectivity();
    // Listen for connectivity changes
  }

  Future<bool> _initializeConnectivity() async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      autofill();
    }
    return isConnected;
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _initializeConnectivity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is loading, you can show a loading indicator
          return LoadingAll(); // Replace this with your loading widget
        } else {
          if (snapshot.hasError) {
            // If an error occurs during the future execution
            return SnapshotErrorHandler(snapshot: snapshot);
          } else {
            // If the future completes successfully
            final isConnected = snapshot.data ?? false;
            if (isConnected) {
              return GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: true,
                    bottomNavigationBar: const BottomNavigation(activeIndex: 4),
                    key: scaffoldKey,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    body: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                      child: ListView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Basic Details',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      EditProfileInputWidget(
                                        lable: 'First Name',
                                        controller:
                                            _model.textfirstNameController ??=
                                                TextEditingController(),
                                      ),
                                      EditProfileInputWidget(
                                        lable: 'Last Name',
                                        controller:
                                            _model.textlastNameController ??=
                                                TextEditingController(),
                                      ),
                                      EditProfileInputWidget(
                                        enabled: false,
                                        lable: 'Email address',
                                        controller:
                                            _model.textEmailController ??=
                                                TextEditingController(),
                                      ),
                                      EditProfileInputWidget(
                                        lable: 'Time Zone',
                                        controller:
                                            _model.textTimeZoneController ??=
                                                TextEditingController(),
                                      ),
                                      // EditProfileInputWidget(
                                      //   lable: 'Designation',
                                      //   controller: _model.textDesignationController ??=
                                      //       TextEditingController(),
                                      // ),
                                    ].divide(const SizedBox(height: 16)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 50, 0, 32),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                                FlutterFlowTheme.of(context)
                                                    .primary
                                              ],
                                              stops: const [0, 1],
                                              begin: const AlignmentDirectional(
                                                  1, -1),
                                              end: const AlignmentDirectional(
                                                  -1, 1),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var connectivityResult =
                                                  await Connectivity()
                                                      .checkConnectivity();
                                              if (connectivityResult ==
                                                  ConnectivityResult.none) {
                                                errorSnackBar('No internet!');
                                              } else {
                                                await _model.fetchEditProfile(
                                                  firstName: _model
                                                      .textfirstNameController
                                                      .text,
                                                  lastName: _model
                                                      .textlastNameController
                                                      .text,
                                                  email: _model
                                                      .textEmailController.text,
                                                  timezone: _model
                                                      .textTimeZoneController
                                                      .text,
                                                  designation: _model
                                                      .textDesignationController
                                                      .text,
                                                );
                                                setState(() {});
                                                if (_model.statusCode == 200) {
                                                  successSnackBar(
                                                      'Thanks for updating your user details!');
                                                  Get.toNamed(Routes.profile);
                                                  // context.pushNamed('Profile');
                                                } else {
                                                  errorSnackBar(_model.message);
                                                  return;
                                                }
                                              }
                                            },
                                            text: 'Save Changes',
                                            options: FFButtonOptions(
                                              height: 40,
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                              iconPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                              color: const Color(0x000494FD),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/NoInternet1.svg',
                        height: 190,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: MediumStyleTitle(
                          text: 'Network error',
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }
        }
      },
    );
  }
}
