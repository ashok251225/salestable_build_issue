import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:salestable/core/index.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String organization = '/organization';
  static const String checkinpage = '/checkinpage';
  static const String editcheckin = '/editcheckin';
  static const String pulse = '/pulse';
  static const String viewpulse = '/viewpulse';
  static const String addpulse = '/addpulse';
  static const String pulsequill = '/pulsequill';
  static const String profile = '/profile';
  static const String editprofile = '/editprofile';
  static const String viewprofile = '/viewprofile';
  static const String notification = '/notification';
  static const String forgotpassword = '/forgotpassword';
  static const String resetpassword = '/resetpassword';
  static const String training = '/training';
}

final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashWidget(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginWidget(),
  ),
  GetPage(
    name: Routes.organization,
    page: () => const OrganizationsWidget(),
  ),
  GetPage(
    name: Routes.dashboard,
    page: () => const DashboardWidget(),
  ),
  GetPage(
    name: Routes.checkinpage,
    page: () => const CheckInPageWidget(),
  ),
  GetPage(
    name: Routes.editcheckin,
    page: () => const EditCheckInWidget(),
  ),
  GetPage(
    name: Routes.pulse,
    page: () => const PulseWidget(),
  ),
  GetPage(
    name: Routes.addpulse,
    page: () => const AddPulseWidget(),
  ),
  GetPage(
    name: Routes.pulsequill,
    page: () => const AddPulseQuillEditor(),
  ),
  GetPage(
    name: Routes.viewpulse,
    page: () => const ViewPostWidget(postId: '', totalLikes: ''),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const ProfileWidget(),
  ),
  GetPage(
    name: Routes.editprofile,
    page: () => const EditProfileWidget(),
  ),
  GetPage(
    name: Routes.viewprofile,
    page: () => const ViewProfileWidget(),
  ),
  GetPage(
    name: Routes.notification,
    page: () => const NotificationsWidget(),
  ),
  GetPage(
    name: Routes.forgotpassword,
    page: () => const ForgotPasswordWidget(),
  ),
  GetPage(
    name: Routes.resetpassword,
    page: () => const ResetPasswordWidget(),
  ),
  GetPage(
    name: Routes.training,
    page: () => const TrainingWidget(),
  ),
];
