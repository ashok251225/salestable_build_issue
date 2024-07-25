import 'dart:io';
import 'package:get/get.dart';
import 'package:salestable/controllers/edit_file_controller.dart';
import 'package:salestable/core/Dto/check_in_DTO.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/check_in_apis/current_check_in_api.dart';
import 'package:salestable/backend/services/check_in_apis/update_check_in_api.dart';
import 'package:salestable/backend/services/check_in_apis/upload_file_api.dart';
import 'package:salestable/models/current_check_in_response.dart';
import 'package:salestable/models/edit_check_in_response.dart';
import 'package:salestable/models/upload_file_response.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'edit_checkin_widget.dart' show EditCheckInWidget;
import 'package:flutter/material.dart';

class EditCheckInModel extends FlutterFlowModel<EditCheckInWidget> {
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  CurrentCheckInData? currentCheckInData;

  TextEditingController? lessonsLearnedController;
  String? Function(BuildContext, String?)? lessonsLearnedControllerValidator;

  TextEditingController? bestPracticesController;
  String? Function(BuildContext, String?)? bestPracticesControllerValidator;

  TextEditingController? remarksController;
  String? Function(BuildContext, String?)? remarkstextControllerValidator;
  List<TextEditingController>? controllers = [];

  // State field(s) for TextField widget.

  // Define other controllers, focus nodes, and validators similarly...

  List<CategoryDTO> categories = [];

  bool error = false;
  num statusCode = 0;

  late EditCheckData editCheckData;
  UploadedData? uploadedData;

  String message = '', checkInDate = '', formattedDate = '';
  final EditFileController _editFileController = Get.put(EditFileController());

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  void autofillDetails({
    String remarks = '',
    lessonsLearned = '',
    bestPractices = '',
    File? additionalFile,
    bool attention = false,
  }) {
    remarksController.text = remarks;
    lessonsLearnedController.text = lessonsLearned;
    bestPracticesController.text = bestPractices;
    _editFileController.setadditionalFile(additionalFile);
  }

  Future<void> sendFile(File file) async {
    CustomResponse<UploadFileResponse> response =
        await UploadFileAPI().call(file: file);
    switch (response.statusCode) {
      case 200:
      case 201:
        statusCode = response.data!.statusCode;
        uploadedData = response.data!.data;
        message = response.data!.message;

        if (statusCode == 200) {
        } else {}
        break;

      default:
        error = true;
        message = response.data!.message.toString();
    }
  }

  Future<void> fetchCurrentCheckIn({String date = ''}) async {
    CustomResponse<CurrentCheckInResponse> response =
        await GetCurrentCheckInsApi().call(onDate: date);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;
        currentCheckInData = response.data!.data;
        await prepareCheckInData(currentCheckInData!);

        break;

      default:
        message = response.data!.message.toString();

        error = true;
    }
  }

  prepareCheckInData(CurrentCheckInData data) {
    String remarks = data.remarks;
    String lessonsLearned = data.lessonsLearned;
    String bestPractices = data.bestPractices;
    bool attention = data.needCustomerAttention;
    String additionalFile = data.additionalFile;

    if (categories.isNotEmpty) {
      categories.clear();
    }

    for (var categoryData in data.categories ?? []) {
      List<GoalDTO> goals = [];

      for (var goalData in categoryData.goals) {
        GoalDTO goal = GoalDTO(
          previousTarget: goalData.previousTarget,
          name: goalData.name,
          description: goalData.description,
          order: goalData.order,
          checkinMessage: goalData.checkinMessage ?? "",
          unit: goalData.unit,
          metric: goalData.metric,
          uuid: goalData.uuid ?? "",
          target: goalData.target,
          expectedTarget: goalData.expectedTarget,
          updatedAt: goalData.updatedAt ?? "",
          delta: goalData.delta,
        );
        goals.add(goal);
      }

      CategoryDTO category = CategoryDTO(
        id: categoryData.id,
        name: categoryData.name,
        isOrganisation: categoryData.isOrganisation,
        description: categoryData.description,
        frequency: categoryData.frequency,
        checkinUuid: categoryData.checkinUuid ?? "",
        goals: goals,
      );

      categories.add(category);
    }

    autofillDetails(
        remarks: remarks.toString(),
        lessonsLearned: lessonsLearned.toString(),
        bestPractices: bestPractices.toString(),
        attention: attention,
        additionalFile: File(additionalFile));
  }

  Future<void> updateCheckin({
    String date = '',
    String urlFile = '',
    String lessonsLearned = '',
    String bestPractices = '',
    required String remarks,
    required bool attention,
    required List<num> inputfields,
  }) async {
    int index = 0; // Track the index of the input field
    int lengthofCategories = categories
        .expand((category) => category.goals.map((goal) => goal.target))
        .toList()
        .length;

    List<num> checkinFields = inputfields.length == lengthofCategories
        ? inputfields
        : inputfields.sublist(inputfields.length - lengthofCategories);

    for (var category in categories) {
      for (var goal in category.goals) {
        // Assign the input field to the target of the goal
        if (index < checkinFields.length) {
          goal.target = checkinFields[index];
          index++; // Move to the next input field
        }
      }
    }

    String fDate = "${date.substring(0, 10)}T00:00:00Z";

    CheckinDTO checkinDto = CheckinDTO(
        startTime: fDate,
        categories: categories,
        needCustomerAttention: attention,
        remarks: remarks,
        lessonsLearned: lessonsLearned,
        bestPractices: bestPractices,
        additionalFile: urlFile.isEmpty ? null : urlFile);

    CustomResponse<EditCheckInResponse> response =
        await UpdateCheckInApi().call(checkinDto: checkinDto);

    switch (response.statusCode) {
      case 200:
      case 201:
        statusCode = response.data!.statusCode;
        editCheckData = response.data!.data;
        message = response.data!.message;

        break;

      default:
        error = true;
        message = response.data!.message.toString();
    }
  }
}
