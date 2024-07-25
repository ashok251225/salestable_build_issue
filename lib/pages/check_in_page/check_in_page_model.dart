import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/check_in_apis/checkin_overview_api.dart';
import 'package:salestable/backend/services/check_in_apis/current_check_in_api.dart';
import 'package:salestable/backend/services/check_in_apis/get_goals_api.dart';
import 'package:salestable/backend/services/dashboard_apis/home_check_in_api.dart';
import 'package:salestable/models/checkin_overview_response.dart';
import 'package:salestable/models/current_check_in_response.dart';
import 'package:salestable/models/get_goals_response.dart';
import 'package:salestable/models/home_check_in_response.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'check_in_page_widget.dart' show CheckInPageWidget;
import 'package:flutter/material.dart';

class CheckInPageModel extends FlutterFlowModel<CheckInPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NotificationBell component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for Checkinpagepost component.

  // Model for Checkinpost component.

  bool error = false;
  num statusCode = 0;
  String checkInDate = '';
  String formattedDate = '';
  String message = '';
  HomeCheckData? homeCheckData;
  bool isCheckInExisted = false;
  String monthlyDescription = '';
  String dailyDescription = '';
  List<Category>? categories = [];
  List<Goal>? salesGoals = [];
  List<Goal> salesActivity = [];
  List<GoalCategory> goalCategory = [];
  List<DataOFGoal> monthlySalesGoals = [];
  List<DataOFGoal> dailySalesActivity = [];

  List<FilteredData> filteredData = [];
  List<FilteredGoal> filteredGoal = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    tabBarController?.dispose();
  }

  Future<void> fetchCurrentCheckIn() async {
    CustomResponse<CurrentCheckInResponse> response =
        await GetCurrentCheckInsApi().call();

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        isCheckInExisted = response.data!.data.checkinExists;
        statusCode = response.data!.statusCode;
        categories = response.data!.data.categories;

        salesGoals = categories![0].goals;
        salesActivity = categories![1].goals;
        break;

      default:
        message = response.data!.message.toString();
        error = true;
    }
  }

  Future<void> fetchSalesGoals() async {
    CustomResponse<GetSalesGoalsResponse> response = await GetGoalsApi().call();

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message!;
        statusCode = response.data!.statusCode!;
        goalCategory = response.data!.data!.categories!;
        monthlySalesGoals = goalCategory.first.goals!;
        dailySalesActivity = goalCategory.last.goals!;
        monthlyDescription = goalCategory.first.description.isNotEmpty
            ? goalCategory.first.description
            : '';
        dailyDescription = goalCategory.last.description.isNotEmpty
            ? goalCategory.last.description
            : '';

        break;

      default:
        message = response.data!.message.toString();

        error = true;
    }

    /// Action blocks are added here.

    /// Additional helper methods are added here.
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

        if (filteredData.isNotEmpty) {
          filteredGoal = filteredData[0].goals;
        }
        break;
      default:
        message = response.data!.message.toString();
        error = true;
    }
  }
}
