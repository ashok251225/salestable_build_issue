import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/edit_checkin_attention_controller.dart';

class YesorNoButton extends StatelessWidget {
  final EditCheckInAttentionController _attentionController =
      Get.put(EditCheckInAttentionController());
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Color>(
      segments: const [
        ButtonSegment<Color>(
          value: Colors.green, // Set a different color for 'Yes'
          label: Text('Yes'),
        ),
        ButtonSegment<Color>(
          value: Colors.red, // Set a different color for 'No'
          label: Text('No'),
        ),
      ],
      selected: _attentionController
              .attentionValue // Set initial value based on controller
          ? {Colors.green} // If attentionValue is true, select 'Yes'
          : {Colors.red}, // Otherwise, select 'No'
      onSelectionChanged: (Set<Color> newSelection) {
        _attentionController.updateSelection(newSelection);
      },
    );
  }
}
