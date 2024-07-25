import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/dashboard_apis/admin_trainingoverview_api.dart';
import 'package:salestable/backend/services/dashboard_apis/get_overall_details_api.dart';
import 'package:salestable/backend/services/dashboard_apis/goal_tracking_monthly_api.dart';
import 'package:salestable/backend/services/dashboard_apis/onboarding_overview_api.dart';
import 'package:salestable/backend/services/pulse_apis/get_post_count_api.dart';
import 'package:salestable/components/dashboard/admin_dashboard/competetiverate_model.dart';
import 'package:salestable/components/dashboard/admin_dashboard/contractvalue_model.dart';
import 'package:salestable/components/dashboard/admin_dashboard/goaltracking_model.dart';
import 'package:salestable/components/dashboard/admin_dashboard/onboarding_model.dart';
import 'package:salestable/components/dashboard/admin_dashboard/ramptime_model.dart';
import 'package:salestable/components/dashboard/admin_dashboard/trainingoverview_model.dart';
import 'package:salestable/components/dashboard/admin_dashboard/winrate_model.dart';
import 'package:salestable/components/notifications/notifications_count_model.dart';
import 'package:salestable/models/admin_training_overview_resp.dart';
import 'package:salestable/models/get_post_count_response.dart';
import 'package:salestable/models/goal_tracking_monthly_resp.dart';
import 'package:salestable/models/onboarding_overview_response.dart';
import 'package:salestable/models/over_details_response.dart';
import 'package:salestable/pages/dashboard/admin_dashboard_widget.dart';
import 'package:salestable/pages/pulse/pulse_model.dart';

import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import '../../core/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDashboardModel extends FlutterFlowModel<AdminDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NotificationBell component.

  // Model for competetiverate component.
  late CompetetiverateModel competetiverateModel;
  // Model for contractvalue component.
  late ContractvalueModel contractvalueModel;
  // Model for ramptime component.
  late RamptimeModel ramptimeModel;
  // Model for winrate component.
  late WinrateModel winrateModel;
  // Model for trainingoverview component.
  late TrainingoverviewModel trainingoverviewModel;
  // Model for onboarding component.
  late OnboardingModel onboardingModel;
  // Model for goaltracking component.
  late GoaltrackingModel goaltrackingModel;
  // Model for pulse component.

  OverallData? overallData;
  Data? trainingData;
  OverViewData? onBoardingData;
  GoalTrackingData? goalTrackingData;

  CountData? postCountData;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    competetiverateModel = createModel(context, () => CompetetiverateModel());
    contractvalueModel = createModel(context, () => ContractvalueModel());
    ramptimeModel = createModel(context, () => RamptimeModel());
    winrateModel = createModel(context, () => WinrateModel());
    trainingoverviewModel = createModel(context, () => TrainingoverviewModel());
    onboardingModel = createModel(context, () => OnboardingModel());
    goaltrackingModel = createModel(context, () => GoaltrackingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();

    competetiverateModel.dispose();
    contractvalueModel.dispose();
    ramptimeModel.dispose();
    winrateModel.dispose();
    trainingoverviewModel.dispose();
    onboardingModel.dispose();
    goaltrackingModel.dispose();
  }

  Future<void> fetchOverallDetails() async {
    CustomResponse<OveralldetailsResponse> response =
        await GetOverallDetailsApi().call();
    if (response.statusCode == 200) {
      overallData = response.data!.data;
    }
  }

  Future<void> fetchTrainingDetails() async {
    CustomResponse<TrainingOverviewResponse> response =
        await TrainingOVerviewApi().call();
    if (response.statusCode == 200) {
      trainingData = response.data!.data;
    }
  }

  Future<void> fetchOnboardingDetails() async {
    CustomResponse<OnboardingOverviewRespone> response =
        await OnboardingOverviewAPI().call();
    if (response.statusCode == 200) {
      onBoardingData = response.data!.data;
    }
  }

  Future<void> fetchGoalTrackingDetails() async {
    CustomResponse<GoalTrackingMonthlyResponse> response =
        await GetGoalTrackingDetailsApi().call();
    if (response.statusCode == 200) {
      goalTrackingData = response.data!.data;
    }
  }

  Future<void> fetchPostCountforAdmin() async {
    CustomResponse<PulsePostCountResponse> response =
        await GetPostCountAPI().call();
    if (response.statusCode == 200) {
      postCountData = response.data!.data;
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
