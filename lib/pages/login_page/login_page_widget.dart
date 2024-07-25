import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/backend/services/sign_in_with_google/google_sign_in_service.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_icon_button.dart';
import 'package:salestable/core/forms/form_text_field.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/controllers/login_controller.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import '../../core/flutter_flow/flutter_flow_widgets.dart';
import 'login_page_model.dart';

export 'login_page_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;
  bool isCalled = false;
  String accessToken = '';
  String socialType = '';

  final GoogleSignInService _googleSignInService = GoogleSignInService();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.textEmailController ??= TextEditingController();

    _model.textPasswordController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    _model.textEmailController;
    _model.textPasswordController;

    super.dispose();
  }

  // final LoginController controller = Get.put(LoginController());

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
              resizeToAvoidBottomInset: false,
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(14.0, 32.0, 14.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/LoginPageLogo.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 40.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome !',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                        lineHeight: 1.0,
                                      ),
                                ),
                                Text(
                                  'Securely access your account',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .smallText,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 24.0),
                                child: SizedBox(
                                    width: 334.0,
                                    child: FormTextField(
                                      borderRadius: 8,
                                      hasDigitsonly: false,
                                      textInputType: TextInputType.emailAddress,
                                      controller: _model.textEmailController!,
                                      labeltext: "Enter your email",
                                      errorKey: 'title',
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: SizedBox(
                                    width: 334.0,
                                    child: FormTextField(
                                      hasDigitsonly: false,
                                      borderRadius: 8,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      obscureText: !_model.isVisible,
                                      controller:
                                          _model.textPasswordController!,
                                      labeltext: "Enter your password",
                                      errorKey: 'title',
                                      suffixIcon: IconButton(
                                        color: const Color(0xFF0494FD),
                                        icon: Icon(_model.isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () => setState(() {
                                          _model.isVisible = !_model.isVisible;
                                        }),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 48.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.checkboxValue = newValue!);

                                    newValue!
                                        ? _model.checkboxValueNum = 1
                                        : _model.checkboxValueNum = 0;
                                  },
                                  activeColor: FlutterFlowTheme.of(context)
                                      .gradientColor1,
                                  checkColor: FlutterFlowTheme.of(context)
                                      .regularTitleWhite,
                                ),
                              ),
                              Text(
                                'Remember me ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context)
                                          .mediumText,
                                      fontSize: 14.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await Support.hasInternet(
                                            child: Get.toNamed(
                                                Routes.forgotpassword));
                                      },
                                      child: Text(
                                        'Forgot password ?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .name,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: GetBuilder<LoginController>(
                                init: LoginController(),
                                builder: (controller) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Support.hasInternet(
                                          child: _signIn());
                                    },
                                    text: isCalled
                                        ? "Logging you in..."
                                        : 'Log In',
                                    options: FFButtonOptions(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 44.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              46.0, 11.0, 46.0, 11.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).addPost,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallStyleTitle(
                              text: 'By signing in, you agree to the ',
                              fontSize: 13,
                              color: FlutterFlowTheme.of(context).mediumText,
                              fontFamily: 'Nunito',
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  fontSize: 13,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  // decoration: TextDecoration.underline, // Add underline
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.salestable.ai/terms-and-conditions/');
                                  },
                              ),
                            ),
                            SmallStyleTitle(
                              text: 'and',
                              fontSize: 13,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontFamily: 'Nunito',
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.bold
                                    // decoration: TextDecoration.underline, // Add underline
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.salestable.ai/privacy-policy/');
                                  },
                              ),
                            )
                          ].divide(const SizedBox(width: 3.0)),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MediumStyleTitle(
                                    text: 'Or Continue with',
                                    color: Color(0xFF68707C),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 94.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowIconButton(
                                    borderColor: Color(0xFF0077B5),
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 55.0,
                                    fillColor: Colors.white,
                                    icon: FaIcon(
                                      FontAwesomeIcons.linkedinIn,
                                      color: Color(0xFF0077B5),
                                      size: 26.0,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Flexible(
                                    child: GestureDetector(
                                  onTap: () async {
                                    var tokens = await _googleSignInService
                                        .signInWithGoogle();
                                    if (tokens.isNotEmpty) {
                                      accessToken = tokens['accessToken'] ?? '';

                                      socialType = "google";
                                      print(accessToken);
                                      print(
                                          'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
                                      await Support.hasInternet(
                                          child: _socialSignIn());
                                      tokens = {};
                                    }
                                  },
                                  child: Container(
                                    width: 94,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF518EF8),
                                          Color(0xFF28B446),
                                          Color(0xFFFBBB00),
                                          Color(0xFFF14336)
                                        ],
                                        stops: [0, 0.5, 0.75, 0.875],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(1, 1, 1, 1),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/google_icon.svg',
                                          width:
                                              24.0, // Adjust the width as needed
                                          height:
                                              24.0, // Adjust the height as needed
                                          fit: BoxFit.none,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ].divide(SizedBox(width: 15.0)),
                            ),
                          ],
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

  void _handleSuccessfulSignIn() async {
    if (_model.orgLength > 1) {
      Get.toNamed(Routes.organization);
      successSnackBar('You have logged in!');
    } else {
      await _model.selectOrganization(orgId: _model.orgId);
      Get.toNamed(Routes.dashboard);
      successSnackBar('You have logged in!');
    }
  }

  Future<void> _signIn() async {
    await _model.signIn(
        email: _model.textEmailController.text.trim(),
        password: _model.textPasswordController.text.trim(),
        rememberMe: _model.checkboxValueNum);
    setState(() {});
    if (_model.statusCode == 200) {
      if (_model.userType == 4) {
        isCalled = true;
        _handleSuccessfulSignIn();
        FocusScope.of(context).unfocus();
      } else {
        errorSnackBar("Please sign in using a user account.");
      }
    } else {
      errorSnackBar(_model.message);
    }
  }

  Future<void> _socialSignIn() async {
    await _model.signInWithSocialPlatform(
        accessToken: accessToken, socialType: socialType);
    setState(() {});
    if (_model.statusCode == 200) {
      if (_model.orgList.isNotEmpty) {
        if (_model.userType == 4 || _model.userType == 1) {
          isCalled = true;
          _handleSuccessfulSignIn();
          //  FocusScope.of(context).unfocus();
        } else {
          await _googleSignInService.signOut();
          errorSnackBar("Please sign in using a user account.");
        }
      } else {
        await _googleSignInService.signOut();
        errorSnackBar("please sign up on the website first");
      }
    } else {
      errorSnackBar(_model.message);
    }
  }
}
