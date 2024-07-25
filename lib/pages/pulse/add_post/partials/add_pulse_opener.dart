import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import '../add_pulse_widget.dart';

class AddPulseOpener extends StatelessWidget {
  const AddPulseOpener({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.23,
      child: FloatingActionButton.extended(
        label: const Text("Post"),
        backgroundColor: FlutterFlowTheme.of(context).addPost,
        foregroundColor: Colors.white,
        onPressed: () async {
          await Get.bottomSheet(
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 1,
              child: const AddPulseWidget(),
            ),
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          );
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
