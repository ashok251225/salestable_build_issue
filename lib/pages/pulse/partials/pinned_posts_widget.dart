import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salestable/components/pulse_cards/pinned_pulse_card/pinned_post_card_widget.dart';
import 'package:salestable/controllers/pulse_controller.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/models/pulse_pinnedpost_response.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PinnedPostsWidget extends StatefulWidget {
  final List<ListPinnedElement> pinnedList;
  final Function() onRefresh;
  const PinnedPostsWidget(
      {super.key, required this.pinnedList, required this.onRefresh});

  @override
  State<PinnedPostsWidget> createState() => _PinnedPostsWidgetState();
}

class _PinnedPostsWidgetState extends State<PinnedPostsWidget> {
  final PulseController pulseController = Get.put(PulseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GetBuilder<PulseController>(
              builder: (pulseController) => Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await refreshPulsePinned();
                  },
                  child: Skeletonizer(
                    enabled: pulseController.refreshindicator,
                    child: ListView.builder(
                      itemCount: widget.pinnedList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => PinnedPostCardWidget(
                        postId: widget.pinnedList[index].id.toString(),
                        nameElement: widget.pinnedList[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> refreshPulsePinned() async {
    pulseController.updaterefreshindicator(true);

    var newData = await widget.onRefresh();
    pulseController.updaterefreshindicator(false);

    return newData;
  }
}
