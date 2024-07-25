// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/shared/buttons/cancel_button.dart';
import 'package:salestable/core/shared/buttons/submit_button.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/shared/snackbars/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import 'add_pulse_model.dart';
export 'add_pulse_model.dart';

class AddPulseWidget extends StatefulWidget {
  const AddPulseWidget({super.key});

  @override
  _AddPulseWidgetState createState() => _AddPulseWidgetState();
}

class _AddPulseWidgetState extends State<AddPulseWidget> {
  late AddPulseModel _model;
  late Future<void> catData;
  List<bool> isChipSelected = List.generate(6, (index) => false);

  bool isInternetOff = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPulseModel());
    catData = fetchData();

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  String selectedCategory = '';

  Future<void> fetchData() async {
    await _model.fetchListPostCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBackground,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Share as',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            FutureBuilder<void>(
              future: catData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie_animations/Salestable_Loading.json',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  isInternetOff = true;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: SnapshotErrorHandler(
                      snapshot: snapshot,
                      height: 120,
                      fontSize: 16,
                    ),
                  );
                } else {
                  return Column(
                      children: [
                    _buildGridView(),
                    !isInternetOff
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CancelButton(
                                    label: "Back",
                                    onPressed: () => Get.back(),
                                  ),
                                ),
                                Expanded(
                                  child: SubmitButton(
                                    label: "Next",
                                    onPressed: () {
                                      if (selectedCategory.isNotEmpty) {
                                        Get.toNamed(Routes.pulsequill);
                                      } else {
                                        isInternetOff
                                            ? errorSnackBar('No internet!')
                                            : errorSnackBar(
                                                "Please select a category");
                                        return;
                                      }
                                    },
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16)),
                            ))
                        : Container(),
                  ].divide(const SizedBox(height: 36)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 5,
        ),
        itemCount: _model.categoryData!.length,
        itemBuilder: (context, index) {
          return ActionChip(
            side:
                BorderSide(color: FlutterFlowTheme.of(context).addpulse),
            label: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                children: [
                  SvgPicture.network(
                    _model.categoryData![index].pictureIcon,
                    width: 16.0,
                    height: 16.0,
                    color: isChipSelected[index] ? Colors.white : null,
                  ),
                  Text(
                    _model.categoryData![index].name.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: isChipSelected[index]
                          ? Colors.white
                          : Color(int.tryParse(_model
                              .categoryData![index].colorCode
                              .replaceAll('#', '0xFF'))!),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ].divide(const SizedBox(width: 4)),
              ),
            ),
            onPressed: () {
              setState(() {
                if (isChipSelected[index]) {
                  // Chip is already selected, so deselect it
                  selectedCategory = '';
                  isChipSelected[index] = false;
                } else {
                  // Chip is not selected, so select it and update selectedCategory
                  selectedCategory =
                      _model.categoryData![index].name.toString();
                  GetHelper.setCategoryId(_model.categoryData![index].uuid);
                  for (int i = 0; i < isChipSelected.length; i++) {
                    isChipSelected[i] = (i == index);
                  }
                }
              });
            },
            backgroundColor: isChipSelected[index]
                ? FlutterFlowTheme.of(context).gradientColor1
                : FlutterFlowTheme.of(context).sameColor,
            elevation: isChipSelected[index] ? 2.0 : 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}
