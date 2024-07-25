// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/backend/services/sign_in_with_google/google_sign_in_service.dart';
import 'package:salestable/components/notifications/notifications_count_widget.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/pages/profile/partials/profile_property_card.dart';
import 'package:salestable/pages/profile/update_password_widget.dart';
import 'package:salestable/core/shared/logout_popup.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;
  final GoogleSignInService _googleSignInService = GoogleSignInService();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
        child: PopScope(
          canPop: false,
          child: SafeArea(
            child: Scaffold(
              bottomNavigationBar: const BottomNavigation(activeIndex: 3),
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Color(0xFF39D2C0),
                      Color(0xFF673AB7),
                      Colors.blue,
                      Colors.red
                    ],
                    stops: [1, 1, 1, 1, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: SizedBox(
                                height: 70,
                                child: Stack(
                                  alignment: const AlignmentDirectional(1, -1),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SvgPicture.asset(
                                        'assets/images/Logo_(9).svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 12, 12, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () => Get.toNamed(
                                                    Routes.dashboard),
                                                child: FaIcon(
                                                  FontAwesomeIcons.arrowLeft,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .regularTitleWhite,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                'Account',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .regularTitleWhite,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                              ),
                                              const NotificationsCountWidget()
                                            ],
                                          ),
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
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1,
                                ),
                              ),
                              alignment: const AlignmentDirectional(-1, -1),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 124, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 60, 16, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl: GetHelper
                                                            .getOrgLogo(),
                                                        width: 40.0,
                                                        height: 32.0,
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                      ),
                                                    ),
                                                    Text(
                                                      GetHelper.getOrgName()
                                                          .toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .merge(TextStyle(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .mediumText,
                                                              fontSize: 16.0,
                                                              fontWeight: FontWeight
                                                                  .bold // You might want to specify a fontSize here
                                                              // You can add more style properties if needed
                                                              )),
                                                    ),
                                                  ].divide(const SizedBox(
                                                    width: 16,
                                                  ))),
                                              GestureDetector(
                                                onTap: () => Support.openUrl(
                                                    'https://www.salestable.ai/faqs/'),
                                                child:
                                                    const ProfilePropertyCard(
                                                  label: "Support",
                                                  proIcon: Icons.info_outline,
                                                  title: 'Help center',
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await Support.hasInternet(
                                                      child: Get.to(() =>
                                                          const ResetPasswordWidget()));
                                                },
                                                child:
                                                    const ProfilePropertyCard(
                                                  label: "App",
                                                  proIcon:
                                                      Icons.password_rounded,
                                                  title: 'Update password',
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => Support.openUrl(
                                                    'https://www.salestable.ai/privacy-policy/'),
                                                child:
                                                    const ProfilePropertyCard(
                                                  label: "Legal",
                                                  proIcon: Icons.lock_outline,
                                                  title: 'Privacy Policy',
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => Support.openUrl(
                                                    'https://www.salestable.ai/terms-and-conditions/'),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.menu_book,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .iconColor,
                                                          size: 20,
                                                        ),
                                                        Text(
                                                          'Terms of Use',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .smallText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 10)),
                                                    ),
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .angleRight,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .iconColor,
                                                      size: 16.5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await Support.hasInternet(
                                                          child:
                                                              _logoutPopUp());
                                                    },
                                                    child: Text(
                                                      'LOG OUT',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .redColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(
                                                const SizedBox(height: 24)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 24, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .cardColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            ),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .trainingCardBorder,
                                              width: 1,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(16, 14, 16, 14),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.15,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.06,
                                                                  clipBehavior: Clip
                                                                      .antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      ImageComponent(
                                                                    hasData: GetHelper
                                                                            .getProfilePic()
                                                                        .isNotEmpty,
                                                                    imageUrl:
                                                                        GetHelper
                                                                            .getProfilePic(),
                                                                  ))
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${GetHelper.getUserFirstName()} ${GetHelper.getUserLastName()}',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        GetHelper
                                                                            .getUserEmail(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/images/timezone.svg',
                                                                      width: 20,
                                                                      height:
                                                                          13.13,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconColor,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        GetHelper
                                                                            .getTimeZone(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(
                                                                      const SizedBox(
                                                                          width:
                                                                              10)),
                                                                ),
                                                                Row(
                                                                    children: [
                                                                  Icon(
                                                                    Icons
                                                                        .work_outline_rounded,
                                                                    size: 15,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .mediumText,
                                                                  ),
                                                                  Text(
                                                                    GetHelper.getDesignation()
                                                                            .isNotEmpty
                                                                        ? GetHelper
                                                                            .getDesignation()
                                                                        : "No Designation",
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                        width:
                                                                            10)))
                                                              ].divide(
                                                                  const SizedBox(
                                                                      height:
                                                                          4)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(const SizedBox(
                                                        height: 8)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
        ));
  }

  Future<void> _logoutPopUp() async {
    await Get.dialog(
      LogoutConfirmation(
          field: 'Are sure you want to logout',
          onConfirm: () async {
            GetHelper.clear();
            await _googleSignInService.signOut();
            Get.toNamed(Routes.login);
          }),
    );
  }
}
