import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/pulse_cards/latest_pulse_card/latest_post_card_widget.dart';
import 'package:salestable/controllers/pulse_controller.dart';
import 'package:salestable/core/dropdown_search/form_drop_down.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/shared/data_component.dart';
import 'package:salestable/models/get_post_count_response.dart';
import 'package:salestable/models/plus_post_response.dart';
import 'package:salestable/pages/pulse/pulse_filter/category_filter/category_filter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LatestPostsWidget extends StatefulWidget {
  final Function({String page, String user, String category}) onCategoryUpdate;
  final Function({String page, String user, String category}) onUserUpdate;

  final List<String> userNames;
  final CountData countData;

  final ScrollController scrollController;

  const LatestPostsWidget(
      {super.key,
      required this.onCategoryUpdate,
      required this.onUserUpdate,
      required this.userNames,
      required this.countData,
      required this.scrollController});

  @override
  State<LatestPostsWidget> createState() => _LatestPostsWidgetState();
}

class _LatestPostsWidgetState extends State<LatestPostsWidget> {
  final PulseController pulseController = Get.put(PulseController());

  final PulseController findPulseController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Count',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                    ),
                    GetBuilder<PulseController>(
                      builder: (pulseController) => FormDropDown(
                        items: widget.userNames,
                        onChanged: (val) async {
                          pulseController.setSelectedUserName(val!);

                          pulseController.updateUserFilter(
                            val,
                          );
                          pulseController.updatePageValue(1);
                          pulseController.updateisLoading(true);

                          await widget.onUserUpdate(
                            page: pulseController.page.toString(),
                            user: val,
                            category: pulseController.category,
                          );

                          pulseController.updateNewPulsefromList(
                              pulseController.pulseList);

                          pulseController.updateisLoading(false);
                        },
                        searchHintText: "Search User",
                      ),
                    )
                  ].divide(const SizedBox(width: 16)),
                ),
                GetBuilder<PulseController>(
                  builder: (pulseController) => PulseCategoryFilter(
                    onUpdate: ({
                      String category = '',
                    }) async {
                      pulseController.updateisLoading(true);
                      pulseController.updateCategoryFilter(
                        category,
                      );
                      pulseController.updatePageValue(1);

                      await widget.onCategoryUpdate(
                        page: pulseController.page.toString(),
                        user: pulseController.user,
                        category: category,
                      );

                      pulseController
                          .updateNewPulsefromList(pulseController.pulseList);

                      pulseController.updateisLoading(false);
                    },
                    categoryCountList: widget.countData.categories,
                  ),
                ),
              ],
            ),
            GetBuilder<PulseController>(
              builder: (pulseController) => DataComponent(
                isLoading: pulseController.isLoading,
                hasData: pulseController.newPulse.isNotEmpty,
                noDataPath: "assets/images/No_Pulse_In.svg",
                noDataText: "Sorry, we could not find any posts",
                hasSecondLine: true,
                topPadding: 120,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await refreshPulsLatest();
                      },
                      child: Skeletonizer(
                        enabled: pulseController.refreshindicator,
                        child: ListView.builder(
                          controller: widget.scrollController,
                          itemCount: pulseController.newPulse.length,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return LatestPostCardWidget(
                              postId:
                                  pulseController.newPulse[index].id.toString(),
                              element: pulseController.newPulse[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GetBuilder<PulseController>(
              builder: (pulseController) {
                if (pulseController.ishasMoreLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF0494FD),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox(); // Return an empty widget if not loading
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<List<ListElement>> refreshPulsLatest() async {
    pulseController.updaterefreshindicator(true);
    pulseController.updatePageValue(1);

    try {
      var newData = await widget.onCategoryUpdate(
        page: pulseController.page.toString(),
        user: pulseController.user,
        category: pulseController.category,
      );
      pulseController.clearNewpulseData();
      pulseController.updateNewPulse(findPulseController.pulseList);
      pulseController.updaterefreshindicator(false);

      return newData;
    } catch (error) {
      print('Error refreshing images: $error');
      pulseController.updaterefreshindicator(false);
      rethrow;
    }
  }
}
