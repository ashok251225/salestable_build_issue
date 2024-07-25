import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/check_in_apis/checkin_overview_api.dart';
import 'package:salestable/backend/services/dashboard_apis/home_check_in_api.dart';
import 'package:salestable/backend/services/dashboard_apis/limitations_of_user_api.dart';
import 'package:salestable/backend/services/pulse_apis/get_post_count_api.dart';
import 'package:salestable/models/checkin_overview_response.dart';
import 'package:salestable/models/get_post_count_response.dart';
import 'package:salestable/models/home_check_in_response.dart';
import 'package:salestable/models/over_details_response.dart';
import 'package:salestable/models/user_limits_response.dart';
import '../../core/shared/get_storage/get_storage_helper.dart';
import '../../components/training/training_card_widget.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NotificationBell component.

  // Model for TrainingCard component.
  late TrainingCardModel trainingCardModel1;
  // Model for TrainingCard component.
  late TrainingCardModel trainingCardModel2;
  // Model for TrainingCard component.
  late TrainingCardModel trainingCardModel3;

  /// Initialization and disposal methods.

  bool error = false;
  num statusCode = 0;
  late OverallData overallData;
  HomeCheckData? homeCheckData;
  UserLimitsData? userLimits;
  bool isCheckInExisted = false;
  String message = '';
  bool onboardingRequired = false;
  bool onboardingCompleted = false;
  bool trainingRequired = false;
  bool trainingCompleted = false;
  bool isOnboarded = false;
  bool isTrained = false;
  bool isReady = false;
  List<FilteredData> filteredData = [];

  CountData countData =
      CountData(totalPosts: 0, totalUserPosts: 0, categories: []);
  @override
  void initState(BuildContext context) {
    trainingCardModel1 = createModel(context, () => TrainingCardModel());
    trainingCardModel2 = createModel(context, () => TrainingCardModel());
    trainingCardModel3 = createModel(context, () => TrainingCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();

    trainingCardModel1.dispose();
    trainingCardModel2.dispose();
    trainingCardModel3.dispose();
  }

  Future<void> fetchDateWiseCheckIn({required String date}) async {
    CustomResponse<CheckInOverviewResponse> response =
        await CheckinOverviewAPI().call(selectedDate: date);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;
        filteredData = response.data!.data;
        GetHelper.setHasCheckinData(filteredData.isNotEmpty);

        break;
      default:
        message = response.data!.message.toString();
        error = true;
    }
  }

  Future<void> fetchPostCount() async {
    CustomResponse<PulsePostCountResponse> response =
        await GetPostCountAPI().call();
    if (response.statusCode == 200) {
      countData = response.data!.data;
    }
  }

  Future<void> fetchHomeCheckIn() async {
    CustomResponse<HomeCheckInResponse> response =
        await HomeCheckInApi().call();
    if (response.statusCode == 200) {
      homeCheckData = response.data!.data;

      isCheckInExisted = homeCheckData!.checkin!.checkinExists;
      GetHelper.setCheckinExisted(isCheckInExisted);
    }
  }

  Future<void> fetchUserLimitation() async {
    CustomResponse<UserLimitResponse> response = await UserLimitsAPI().call();
    if (response.statusCode == 200) {
      userLimits = response.data!.data;
      onboardingRequired = userLimits!.onboarding.required;
      onboardingCompleted = userLimits!.onboarding.completed;
      trainingRequired = userLimits!.training.required;
      trainingCompleted = userLimits!.training.completed;

      if (onboardingRequired) {
        if (onboardingCompleted) {
          isOnboarded = true;
        } else {
          isOnboarded = false;
        }
      } else {
        isOnboarded = true;
      }

      if (trainingRequired) {
        if (trainingCompleted) {
          isTrained = true;
        } else {
          isTrained = false;
        }
      } else {
        isTrained = true;
      }

      GetHelper.setIsOnboarded(onboardingRequired);
      GetHelper.setIsTrained(trainingRequired);
      if (isOnboarded && isTrained) {
        isReady = true;
      } else {
        isReady = false;
      }
    }
  }
}
