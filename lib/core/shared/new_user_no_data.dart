import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../texts/medium_style_title.dart';
import '../texts/small_style_title.dart';

class NewUserNoData extends StatelessWidget {
  const NewUserNoData({
    super.key,
    required this.noDataText,
  });
  final String noDataText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/new_user_no_data.svg",
            fit: BoxFit.cover,
            height: 250,
            width: 250,
          ),
          MediumStyleTitle(
            text: noDataText,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          SmallStyleTitle(
            text: stateText(),
            fontSize: 12,
            color: FlutterFlowTheme.of(context).smallText,
          ),
        ].divide(
          const SizedBox(height: 12),
        ),
      ),
    );
  }

  String stateText() {
    bool isOnboarded = GetHelper.getIsOnboarded();
    bool isTrained = GetHelper.getIsTrained();

    if (isOnboarded && isTrained) {
      return "Please finish onboarding and training first on website";
    }
    if (isOnboarded) {
      return "Please finish onboarding first on website";
    }
    if (isTrained) {
      return "Please finish training first on website";
    }

    // a return statement for cases where neither condition is met
    return "Onboarding and training not started yet";
  }
}
