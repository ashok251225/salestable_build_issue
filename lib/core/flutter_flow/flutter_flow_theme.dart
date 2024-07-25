// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color regularTitleBlack;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color teritaryText;
  late Color alternateText;
  late Color gradientColor1;
  late Color gradientColor2;
  late Color borderColor;
  late Color textColor;
  late Color customColor1;
  late Color customColor2;
  late Color lineColor;
  late Color iconColor;
  late Color cardColor;
  late Color cardBorder;
  late Color smallText;
  late Color loginButton;
  late Color loginText;
  late Color trainingCard;
  late Color customColor3;
  late Color trainingCardBorder;
  late Color white;
  late Color dashboardCard;
  late Color backgroundBorder;
  late Color commentsText;
  late Color regularTitleWhite;
  late Color calenderText;
  late Color dividerColor;
  late Color tabColor;
  late Color aTabColor;
  late Color tabText;
  late Color linearColor;
  late Color linearBackground;
  late Color mediumText;
  late Color trackingText;
  late Color trainingCardText;
  late Color salesText;
  late Color name;
  late Color regularTitleGreen;
  late Color checkInBorder;
  late Color chekckInBg;
  late Color sameColor;
  late Color checkinCardColor1;
  late Color checkinCardColor2;
  late Color checkinTitleColor1;
  late Color checkinTitleColor2;
  late Color checkinColor;
  late Color redColor;
  late Color addPost;
  late Color addComment;
  late Color focusColor;
  late Color bottomIconColor;
  late Color addpulse;
  late Color dailycolor;
  late Color monthlycolor;
  late Color piebackground;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF000000);
  late Color secondary = const Color(0xFF006DBC);
  late Color tertiary = const Color(0xFF2DC38D);
  late Color alternate = const Color(0xFFECF7FF);
  late Color primaryText = const Color(0xFF090909);
  late Color regularTitleBlack = const Color(0xFF090909);

  late Color secondaryText = const Color(0xFF464646);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFECF7FF);
  late Color accent1 = const Color(0xFF0B55DA);
  late Color accent2 = const Color(0xFF84B8FE);
  late Color accent3 = const Color(0xFFF1282E);
  late Color accent4 = const Color(0xFFEB9B42);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFF000000);

  late Color teritaryText = const Color(0xFF314A5E);
  late Color alternateText = const Color(0xFF0494FD);
  late Color gradientColor1 = const Color(0xFF0494FD);
  late Color gradientColor2 = const Color(0xFF006DBC);
  late Color borderColor = const Color(0xFF8391A1);
  late Color textColor = const Color(0xFFF5A015);
  late Color customColor1 = const Color(0xFF151515);
  late Color customColor2 = const Color(0xFF424242);
  late Color lineColor = const Color(0xFF8391A1);
  late Color iconColor = const Color(0xFF5C5C5C);
  late Color cardColor = const Color(0xFFECF7FF);
  late Color cardBorder = const Color(0xFF0494FD);
  late Color smallText = const Color(0xFF5C5C5C);
  late Color loginButton = const Color(0xFFFFFFFF);
  late Color loginText = const Color(0xFF0494FD);
  late Color trainingCard = const Color(0xFF000000);
  late Color customColor3 = const Color(0xFF93569D);
  late Color trainingCardBorder = const Color(0xFFC4C4C4);
  late Color white = const Color(0xFFFFFFFF);
  late Color dashboardCard = const Color(0xFFFFFFFF);
  late Color backgroundBorder = const Color(0xFFE2E8EC);
  late Color commentsText = const Color(0xFF3F3F3F);
  late Color regularTitleWhite = const Color(0xFFE2E2E2);
  late Color calenderText = const Color(0xFFFFFFFF);
  late Color dividerColor = const Color(0xFFE0E0E0);
  late Color tabColor = const Color(0xFFFFFFFF);
  late Color aTabColor = const Color(0xFFECF7FF);
  late Color tabText = const Color(0xFF080808);
  late Color linearColor = const Color(0xFFDAEFFF);
  late Color linearBackground = const Color(0xFFE0EAFC);
  late Color mediumText = const Color(0xFF2B2A2A);
  late Color trackingText = const Color(0xFF494949);
  late Color trainingCardText = const Color(0xFF121010);
  late Color salesText = const Color(0xFF252525);
  late Color name = const Color(0xFF0494FD);
  late Color regularTitleGreen = const Color(0xFF2DC38D);
  late Color checkInBorder = const Color(0xFFFFFFFF);
  late Color chekckInBg = const Color(0xFFD7F4EA);
  late Color sameColor = const Color(0xFFFFFFFF);
  late Color checkinCardColor1 = const Color(0xFFD7F4EA);
  late Color checkinCardColor2 = const Color(0xFFBAE2FF);
  late Color checkinTitleColor1 = const Color(0xFF2DC38D);
  late Color checkinTitleColor2 = const Color(0xFF0494FD);
  late Color checkinColor = const Color(0xFFCF6679);
  late Color redColor = const Color(0xFFF1282E);
  late Color addPost = const Color(0xFF0494FD);
  late Color addComment = const Color(0xFF0494FD);
  late Color focusColor = const Color(0xFFFFFFFF);
  late Color bottomIconColor = const Color(0xFF000000);
  late Color addpulse = const Color(0xFF0494FD);
  late Color dailycolor = const Color(0xFC0052D4);
  late Color monthlycolor = const Color(0xFF2DC38D);
  late Color piebackground = const Color(0xffffffff);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Nunito';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Nunito';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Nunito';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Nunito';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Nunito';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Nunito';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Nunito';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryBackground,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleMediumFamily => 'Nunito';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get titleSmallFamily => 'Nunito';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelLargeFamily => 'Nunito';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Nunito';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Nunito';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Nunito',
        color: const Color(0xFFAAAAAA),
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyLargeFamily => 'Nunito';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyMediumFamily => 'Nunito';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodySmallFamily => 'Nunito';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 10.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Nunito';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Nunito';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Nunito';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Nunito';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Nunito';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Nunito';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Nunito';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Nunito';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Nunito';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Nunito';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Nunito';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Nunito';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Nunito';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Nunito';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Nunito';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Nunito';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Nunito';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Nunito';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Nunito';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Nunito';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Nunito';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Nunito';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Nunito';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Nunito';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Nunito';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Nunito';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Nunito';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Nunito';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Nunito';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Nunito';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFF2DC38D).withOpacity(0.5);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryText = const Color(0xFFE2E2E2);
  late Color regularTitleBlack = const Color(0xFF090909);
  late Color secondaryText = const Color(0xFF9E9E9E);
  late Color primaryBackground = const Color(0xFF121212);
  late Color secondaryBackground = const Color(0xFF14181B);
  late Color accent1 = const Color(0xFF0B55DA);
  late Color accent2 = const Color(0xFF84B8FE);
  late Color accent3 = const Color(0xFFF1282E);
  late Color accent4 = const Color(0xB2262D34);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xB2FFFFFF);

  late Color teritaryText = const Color(0x980FE1C9);
  late Color alternateText = const Color(0xFF0FCDA2);
  late Color gradientColor1 = const Color(0xFF0494FD);
  late Color gradientColor2 = const Color(0xFF5C3AD9);
  late Color borderColor = const Color(0xFF1CA709);
  late Color textColor = const Color(0xFFF5A015);
  late Color customColor1 = const Color(0xFF3B5DA8);
  late Color customColor2 = const Color(0xFF854F38);
  late Color lineColor = const Color(0x63FFFFFF);
  late Color iconColor = const Color(0xFFE2E2E2);
  late Color cardColor = const Color(0xFF1E1E1E);
  late Color cardBorder = const Color(0xFF2C2C2C);
  late Color smallText = const Color(0xFF9E9E9E);
  late Color loginButton = const Color(0xFF0494FD);
  late Color loginText = const Color(0xFFFFFFFF);
  late Color trainingCard = const Color(0xFF0494FD);
  late Color customColor3 = const Color(0xFF93569D);
  late Color trainingCardBorder = const Color(0xFF2C2C2C);
  late Color white = const Color(0x651F1B16);
  late Color dashboardCard = const Color(0x661F1B16);
  late Color backgroundBorder = const Color(0x00000000);
  late Color commentsText = const Color(0xB3FFFFFF);
  late Color regularTitleWhite = const Color(0xFFE2E2E2);
  late Color calenderText = const Color(0xFF492C99);
  late Color dividerColor = const Color(0xFF2C2C2C);
  late Color tabColor = const Color(0xFF7E8595).withOpacity(0.5);
  late Color aTabColor = const Color(0xFF25272C);
  late Color tabText = const Color(0xE6FFFFFF);
  late Color linearColor = const Color(0x661F1B16);
  late Color linearBackground = const Color(0x661F1B16);
  late Color mediumText = const Color(0xFFE0E0E0).withOpacity(0.85);
  late Color trackingText = const Color(0xFF828282);
  late Color trainingCardText = const Color(0xBEFFFFFF);
  late Color salesText = const Color(0xFFFFFFFF);
  late Color name = const Color(0xFFFFFFFF);
  late Color regularTitleGreen = const Color(0xFF2DC38D);
  late Color checkInBorder = const Color(0x8DC4C4C4);
  late Color chekckInBg = const Color(0x00FFFFFF);
  late Color sameColor = const Color(0x00FFFFFF);
  late Color checkinCardColor1 = const Color(0xFF2E2E2E);
  late Color checkinCardColor2 = const Color(0xFF2E2E2E);
  late Color checkinTitleColor1 = const Color(0xFFE0E0E0);
  late Color checkinTitleColor2 = const Color(0xFFE0E0E0);
  late Color checkinColor = const Color(0xFFE0E0E0);
  late Color redColor = const Color(0xFFCF6679);
  late Color addPost = const Color(0xFF0494FD).withOpacity(0.9);
  late Color addComment = const Color(0xFF0494FD).withOpacity(0.5);
  late Color focusColor = const Color(0xFF1E1E1E);
  late Color bottomIconColor = const Color(0xFF9E9E9E).withOpacity(0.75);
  late Color addpulse = const Color(0xFF0494FD).withOpacity(0.2);
  late Color dailycolor = const Color(0xFC0052D4).withOpacity(0.5);
  late Color monthlycolor = const Color(0xFF2DC38D).withOpacity(0.5);
  late Color piebackground = const Color(0xff1E1E1E);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
