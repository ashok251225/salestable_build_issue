// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:get/get.dart';
import 'package:salestable/core/Dto/check_in_DTO.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/texts/large_style_title.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/pages/edit_check_in/partials/edit_checkin_additional_file.dart';
import 'package:salestable/controllers/edit_checkin_attention_controller.dart';
import 'package:salestable/controllers/edit_file_controller.dart';
import 'package:salestable/core/shared/buttons/cancel_button.dart';
import 'package:salestable/core/shared/buttons/submit_button.dart';
import 'package:salestable/core/shared/data_component.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';
import '../../controllers/edit_checkIn_controller.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'edit_checkin_model.dart';
import 'partials/checkIn_question.dart';
import 'partials/checkin_text_field.dart';
import 'partials/edit_checkin_header.dart';
import 'partials/yes_or_no_button.dart';
export 'edit_checkin_model.dart';

class EditCheckInWidget extends StatefulWidget {
  const EditCheckInWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditCheckInWidgetState createState() => _EditCheckInWidgetState();
}

class _EditCheckInWidgetState extends State<EditCheckInWidget> {
  late EditCheckInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<void> _futureData;
  final EditCheckinController _editCheckinController =
      Get.put(EditCheckinController());

  final EditCheckInAttentionController _attentionController =
      Get.put(EditCheckInAttentionController());
  final EditFileController _editFileController = Get.put(EditFileController());

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCheckInModel());
    _editCheckinController.selectedDate =
        Get.arguments != null ? Get.arguments['date'] : DateTime.now();
    _model.controllers ??= [TextEditingController()];
    _model.remarksController ??= TextEditingController();
    _model.lessonsLearnedController ??= TextEditingController();
    _model.bestPracticesController ??= TextEditingController();
    _futureData = fetchData();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> fetchData() async {
    await _model.fetchCurrentCheckIn(
      date: Support.formatDate(
          value: _editCheckinController.selectedDate.toString()),
    );
  }

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
        // onTap: () => _model.unfocusNode.canRequestFocus
        //     ? FocusScope.of(context).requestFocus(_model.unfocusNode)
        //     : FocusScope.of(context).unfocus(),
        child: PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: const BottomNavigation(activeIndex: 1),
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: FutureBuilder(
              future: _futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingAll();
                } else if (snapshot.hasError) {
                  return SnapshotErrorHandler(snapshot: snapshot);
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).accent1,
                          FlutterFlowTheme.of(context).accent2
                        ],
                        stops: const [0, 0.5],
                        begin: const AlignmentDirectional(0.03, -1),
                        end: const AlignmentDirectional(-0.03, 1),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1, -1),
                          child: Stack(
                            alignment: const AlignmentDirectional(1, -1),
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/Logo_(9).svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const EditCheckinHeader(),
                                    InkWell(
                                      onTap: () {
                                        _presentDatePicker();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                          GetBuilder<EditCheckinController>(
                                            builder: (_editCheckinController) =>
                                                LargeStyleTitle(
                                              text: DateFormat("MM-dd-yyyy")
                                                  .format(_editCheckinController
                                                      .selectedDate),
                                              color: Colors.white,
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
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    topRight:
                                                        Radius.circular(16),
                                                  ),
                                                ),
                                                child: GetBuilder<
                                                    EditCheckinController>(
                                                  builder:
                                                      (_editCheckinController) =>
                                                          DataComponent(
                                                    isLoading:
                                                        _editCheckinController
                                                            .isLoading,
                                                    hasData: _model
                                                        .categories.isNotEmpty,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Column(children: [
                                                        ListView.builder(
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: _model
                                                              .categories
                                                              .length,
                                                          itemBuilder: (context,
                                                              int index) {
                                                            CategoryDTO
                                                                category =
                                                                _model.categories[
                                                                    index];
                                                            return CheckinQuestion(
                                                              category:
                                                                  category,
                                                              controllers: _model
                                                                  .controllers,
                                                            );
                                                          },
                                                        ),const SizedBox(height: 4,),
                                                        Column(
                                                            children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    MediumStyleTitle(
                                                                  text:
                                                                      'Do any of your customer needs attention?',
                                                                  fontSize: 14,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .mediumText,
                                                                ),
                                                              ),
                                                            ].divide(
                                                              const SizedBox(
                                                                  width: 15),
                                                            ),
                                                          ),
                                                          GetBuilder<
                                                              EditCheckInAttentionController>(
                                                            builder:
                                                                (_attentionController) {
                                                              return Row(
                                                                children: [
                                                                  YesorNoButton()
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                          const SizedBox(height: 4,),
                                                          GetBuilder<
                                                                  EditCheckInAttentionController>(
                                                              builder:
                                                                  (_attentionController) {
                                                            return _attentionController
                                                                    .attentionValue
                                                                ? CheckinTextField(
                                                                    controller:
                                                                        _model
                                                                            .remarksController!,
                                                                    question:
                                                                        "Elaborate issues you're facing",
                                                                    qHint: '')
                                                                : Container();
                                                          }),
                                                          SizedBox(height: 4,),
                                                          CheckinTextField(
                                                              controller: _model
                                                                  .lessonsLearnedController!,
                                                              question:
                                                                  "Lessons learned?",
                                                              qHint:
                                                                  'Share a key lesson learned today..'),
                                                                  SizedBox(height: 4,),
                                                          CheckinTextField(
                                                              controller: _model
                                                                  .bestPracticesController!,
                                                              question:
                                                                  "Best Practices?",
                                                              qHint:
                                                                  'Share a best practice..'),SizedBox(height: 4,),
                                                          EditCheckinAdditionalFile()
                                                        ].divide(const SizedBox(
                                                                height: 8))),
                                                        const SizedBox(
                                                            height: 16),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            const Expanded(
                                                                child:
                                                                    CancelButton()),
                                                            Expanded(
                                                              child:
                                                                  SubmitButton(
                                                                      label:
                                                                          "Save",
                                                                      onPressed:
                                                                          () async {
                                                                        await Support.hasInternet(
                                                                            child:
                                                                                updateTheCheckIn());
                                                                      }),
                                                            ),
                                                          ].divide(
                                                              const SizedBox(
                                                                  width: 16)),
                                                        ),
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    ));
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day - 1);
    final lastDate = now;

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _editCheckinController.selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);
    _editCheckinController.updateLoadingValue(true);
    _editCheckinController.updateSelectedDate(pickedDate!);

    await _model.fetchCurrentCheckIn(
      date: Support.formatDate(
          value: _editCheckinController.selectedDate.toString()),
    );

    _editCheckinController.updateLoadingValue(false);
  }

  Future<void> updateTheCheckIn() async {
    await _model.updateCheckin(
        date: _editCheckinController.selectedDate.toString(),
        inputfields: _model.controllers!
            .map(
              (e) => int.tryParse(e.text.trim()) != null
                  ? int.parse(e.text.trim())
                  : 0,
            )
            .toList(),
        urlFile: Support.filetoString(_editFileController.additionalFile),
        lessonsLearned: _model.lessonsLearnedController.text.trim(),
        bestPractices: _model.bestPracticesController.text.trim(),
        remarks: _model.remarksController.text.trim(),
        attention: _attentionController.attentionValue);

    setState(() {});

    if (_model.statusCode == 200) {
      successSnackBar('Your goal-checkin has succeeded!');
      Get.toNamed(Routes.checkinpage, arguments: {
        'date': _editCheckinController
            .selectedDate, // Assuming selectedDate is the date parameter
      });
    } else {
      errorSnackBar(_model.message);
      return;
    }
  }
}
