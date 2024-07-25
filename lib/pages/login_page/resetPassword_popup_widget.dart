import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/pages/login_page/resetPassword_popup_model.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordPopupWidget extends StatefulWidget {
  const ResetPasswordPopupWidget({super.key});

  @override
  State<ResetPasswordPopupWidget> createState() =>
      _ResetPasswordPopupWidgetState();
}

class _ResetPasswordPopupWidgetState extends State<ResetPasswordPopupWidget> {
  late ResetPasswordPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPasswordPopupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        width: double.infinity,
        height: 342,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            const BoxShadow(
              blurRadius: 5,
              color: Color(0x16000000),
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC3FFEA),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: SvgPicture.asset(
                        'assets/images/forgot_password_email.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Thank you!',
                          textAlign: TextAlign.center,
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
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'We\'ve sent password reset instructions to your email address. If no email is received within ten minutes, please check that you\'ve submitted the correct address.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).mediumText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                                lineHeight: 1.5,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.login),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_backspace_sharp,
                      color: FlutterFlowTheme.of(context).gradientColor1,
                      size: 18,
                    ),
                    Flexible(
                      child: Text(
                        'Go Back to Login',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .titleMediumFamily,
                              color:
                                  FlutterFlowTheme.of(context).gradientColor1,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleMediumFamily),
                            ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 10)),
                ),
              ),
            ].divide(const SizedBox(height: 24)),
          ),
        ),
      ),
    );
  }
}
