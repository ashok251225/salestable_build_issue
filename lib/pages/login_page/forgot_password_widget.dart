// ignore_for_file: use_build_context_synchronously

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:salestable/core/forms/form_text_field.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/pages/login_page/resetPassword_popup_widget.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import '../../core/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgot_password_model.dart';
export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordModel());

    _model.resetEmailController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    _model.resetEmailController;
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
              key: scaffoldKey,
              resizeToAvoidBottomInset: true,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_sharp,
                            color: FlutterFlowTheme.of(context).iconColor,
                            size: 18,
                          ),
                        ),
                        Text(
                          'Forgot password',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleLargeFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleLargeFamily),
                              ),
                        ),
                        const SizedBox(
                          width: 24,
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/forgot_password.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Enter your registered email address below\n your password reset link has been sent\n to the provided email address',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .mediumText,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(height: 24)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Container(
                                      width: 334.0,
                                      child: FormTextField(
                                        borderRadius: 8,
                                        hasDigitsonly: false,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        controller:
                                            _model.resetEmailController!,
                                        labeltext: "Enter your email",
                                        errorKey: 'title',
                                      ))),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 24)),
                    ),
                  ]),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 32),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF006DBC), Color(0xFF0494FD)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, 0),
                            end: AlignmentDirectional(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Support.hasInternet(child: resetPassword());
                          },
                          text: 'Send',
                          options: FFButtonOptions(
                            height: 40,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            color: const Color(0x000494FD),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  fontSize: 16,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> resetPassword() async {
    await _model.forgotPassword(
      email: _model.resetEmailController.text.trim(),
    );

    setState(() {});
    if (_model.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            content: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust width as needed
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust height as needed
              child: const ResetPasswordPopupWidget(),
            ),
          );
        },
      );
    } else {
      errorSnackBar('${_model.message}');
      return;
    }
  }
}
