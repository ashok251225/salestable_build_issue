import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/support/support.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'shared/premium_feature_pop_up.dart';

class BottomNavigation extends StatefulWidget {
  final int activeIndex;

  const BottomNavigation({super.key, required this.activeIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: FlutterFlowTheme.of(context).bottomIconColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.activeIndex,
      selectedItemColor: FlutterFlowTheme.of(context).gradientColor1,
      backgroundColor: FlutterFlowTheme.of(context).cardColor,
      items: [
        BottomNavigationBarItem(
          icon: widget.activeIndex == 0
              ? SvgPicture.asset(
                  'assets/images/home_filled.svg',
                  height: 24,
                  width: 24,
                )
              : SvgPicture.asset(
                  'assets/images/home.svg',
                  height: 24,
                  width: 24,
                  color: FlutterFlowTheme.of(context).bottomIconColor,
                ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: widget.activeIndex == 1
              ? SvgPicture.asset(
                  'assets/images/check_in_filled.svg',
                  height: 24,
                  width: 24,
                )
              : SvgPicture.asset(
                  'assets/images/check_in.svg',
                  height: 24,
                  width: 24,
                  color: FlutterFlowTheme.of(context).bottomIconColor,
                ),
          label: "Check in",
        ),
        BottomNavigationBarItem(
          icon: widget.activeIndex == 2
              ? SvgPicture.asset(
                  'assets/images/stream_filled.svg',
                  height: 24,
                  width: 24,
                )
              : SvgPicture.asset(
                  'assets/images/stream.svg',
                  height: 24,
                  width: 24,
                  color: FlutterFlowTheme.of(context).bottomIconColor,
                ),
          label: "Pulse",
        ),
        // BottomNavigationBarItem(
        //   icon: widget.activeIndex == 3
        //       ? SvgPicture.asset(
        //           'assets/images/training_filled.svg',
        //           height: 24,
        //           width: 24,
        //         )
        //       : SvgPicture.asset(
        //           'assets/images/training.svg',
        //           height: 24,
        //           width: 24,
        //         ),
        //   label: "Training",
        // ),
        BottomNavigationBarItem(
          icon: widget.activeIndex == 3
              ? SvgPicture.asset(
                  'assets/images/profile_filled.svg',
                  height: 24,
                  width: 24,
                )
              : SvgPicture.asset(
                  'assets/images/profile.svg',
                  height: 24,
                  width: 24,
                  color: FlutterFlowTheme.of(context).bottomIconColor,
                ),
          label: "Profile",
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Support().clearPulseFilters();
            if (widget.activeIndex != 0) Get.toNamed(Routes.dashboard);
            break;
          case 1:
            Support().clearPulseFilters();
            if (widget.activeIndex != 1) Get.toNamed(Routes.checkinpage);
            break;
          case 2:
            // GetHelper.getSubscriptionValue() == 2
            //     ? (widget.activeIndex != 2
            //         ? () {
            //             Support().clearPulseFilters();
            //             Get.toNamed(Routes.pulse);
            //           }()
            //         : null)
            //     : premiumFeature();
            Support().clearPulseFilters();
            if (widget.activeIndex != 2) Get.toNamed(Routes.pulse);
            break;
          case 3:
            Support().clearPulseFilters();
            if (widget.activeIndex != 3) Get.toNamed(Routes.profile);
            break;
          // case 4:
          //   clearPulseFilters();
          //   if (widget.activeIndex != 4) Get.toNamed(Routes.profile);
          //   break;
        }
      },
    );
  }

  Future<void> premiumFeature() async {
    await Get.dialog(const PremiumFeaturePopUp());
  }
}
