import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/training/get_all_modules_api.dart';
import 'package:salestable/backend/services/training/get_recent_modules_api.dart';
import 'package:salestable/models/get_list_all_modules_response.dart';
import 'package:salestable/models/recent_modules_response.dart';
import '../../../components/training/in_progress_card_widget.dart';
import '../../../components/training/upcoming_training_card_widget.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';

import 'training_widget.dart' show TrainingWidget;
import 'package:flutter/material.dart';

class TrainingModel extends FlutterFlowModel<TrainingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NotificationBell component.

  // Model for InProgressCard component.
  late InProgressCardModel inProgressCardModel;
  // Model for UpcomingTrainingCard component.
  late UpcomingTrainingCardModel upcomingTrainingCardModel;

  List<RecentModulesData>? recentModulesData;

  ModulesData modulesData = ModulesData(
      assessmentAdded: false,
      assessmentStatus: 0,
      completedCount: 0,
      ratingGiven: false,
      readinessIndex: 0,
      totalModulesRequired: 0,
      isCompletedForAssessment: false,
      list: [],
      totalPublishedModules: 0);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    inProgressCardModel = createModel(context, () => InProgressCardModel());
    upcomingTrainingCardModel =
        createModel(context, () => UpcomingTrainingCardModel());
    modulesData;
  }

  @override
  void dispose() {
    unfocusNode.dispose();

    inProgressCardModel.dispose();
    upcomingTrainingCardModel.dispose();
  }

  Future<void> fetchAllModules() async {
    CustomResponse<ListAllModulesResponse> response =
        await GetListAllModulesAPI().call();
    if (response.statusCode == 200) {
      modulesData = response.data!.data;
    }
  }

  Future<void> fetchRecentModules() async {
    CustomResponse<RecentModulesResponse> response =
        await RecentModulesAPI().call();
    if (response.statusCode == 200) {
      recentModulesData = response.data!.data;
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
