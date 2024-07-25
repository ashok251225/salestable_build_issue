import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:salestable/core/forms/form_text_field.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/pages/login_page/forgot_password_widget.dart';
import 'package:salestable/pages/profile/profile_widget.dart';
import 'package:salestable/pages/profile/update_password_model.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';

import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import '../../core/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  late ResetPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPasswordModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
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
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: FlutterFlowTheme.of(context).iconColor,
                          size: 24,
                        ),
                      ),
                      Text(
                        'Reset Password',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              color:
                                  FlutterFlowTheme.of(context).gradientColor1,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: FlutterFlowTheme.of(context).sameColor,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 328,
                                      child: FormTextField(
                                        hasDigitsonly: false,
                                        borderRadius: 8,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        obscureText:
                                            !_model.passwordVisibility1,
                                        controller: _model.textController1!,
                                        label: "Current Password",
                                        labeltext:
                                            "Type in your current password",
                                        errorKey: 'title',
                                        suffixIcon: IconButton(
                                          color: const Color(0xFF0494FD),
                                          icon: Icon(_model.passwordVisibility1
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () => setState(() {
                                            _model.passwordVisibility1 =
                                                !_model.passwordVisibility1;
                                          }),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password is required';
                                          }
                                          // Add other validation logic here
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: FormTextField(
                                    hasDigitsonly: false,
                                    borderRadius: 8,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: !_model.passwordVisibility2,
                                    controller: _model.textController2!,
                                    label: "New Password",
                                    labeltext: "New Password",
                                    errorKey: 'title',
                                    suffixIcon: IconButton(
                                      color: const Color(0xFF0494FD),
                                      icon: Icon(_model.passwordVisibility2
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () => setState(() {
                                        _model.passwordVisibility2 =
                                            !_model.passwordVisibility2;
                                      }),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      if (!value.contains(RegExp(r'\d'))) {
                                        return 'Password must contain at least one digit';
                                      }
                                      if (!value.contains(RegExp(r'[A-Z]'))) {
                                        return 'Password must contain at least one uppercase letter';
                                      }
                                      if (!value.contains(RegExp(r'[a-z]'))) {
                                        return 'Password must contain at least one lowercase letter';
                                      }
                                      if (!value.contains(
                                          RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                        return 'Password must contain at least one special character';
                                      }
                                      return null;
                                    },
                                  )),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 328,
                                      child: FormTextField(
                                        hasDigitsonly: false,
                                        borderRadius: 8,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        obscureText:
                                            !_model.passwordVisibility3,
                                        controller: _model.textController3!,
                                        label: "Confirm New Password",
                                        labeltext: "Confirm Password",
                                        errorKey: 'title',
                                        suffixIcon: IconButton(
                                          color: const Color(0xFF0494FD),
                                          icon: Icon(_model.passwordVisibility3
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () => setState(() {
                                            _model.passwordVisibility3 =
                                                !_model.passwordVisibility3;
                                          }),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please confirm your password';
                                          }
                                          if (value !=
                                              _model.textController2.text) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => const ForgotPasswordWidget());
                                      },
                                      child: Text(
                                        'Forgotten your password ?',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gradientColor1,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 32, 0, 32),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF006DBC),
                                        Color(0xFF0494FD)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(1, 0),
                                      end: AlignmentDirectional(-1, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Support.hasInternet(
                                          child: _resetPassword());
                                    },
                                    text: 'Save ',
                                    options: FFButtonOptions(
                                      height: 40,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              24, 0, 24, 0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: const Color(0x000494FD),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            fontSize: 16,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
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
                      ],
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

  Future<void> _resetPassword() async {
    if (formKey.currentState!.validate()) {
      await _model.resetPassword(
          currentPassword: _model.textController1.text.trim(),
          newPassword: _model.textController3.text.trim());

      setState(() {});
      if (_model.statusCode == 200) {
        successSnackBar('You have changed your password');
        Get.to(const ProfileWidget());
      } else {
        errorSnackBar('${_model.message}');
        return;
      }
    }
  }
}
