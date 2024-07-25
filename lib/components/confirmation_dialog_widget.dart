import 'package:flutter/material.dart';
export 'package:salestable/pages/training/index_screen/index_page_model.dart';

class ConfirmationDialog extends StatefulWidget {
  const ConfirmationDialog({
    super.key,
  });

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Are you sure you want to mark  content as complete?'),
          SizedBox(height: 8),
          Text('Content suggested duration should be minutes, not 0 minutes.'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Continue action
            Navigator.of(context)
                .pop(false); // Return false to indicate continue action
          },
          child: const Text('Continue'),
        ),
        ElevatedButton(
          onPressed: () {
            // Mark as complete action
            Navigator.of(context)
                .pop(true); // Return true to indicate mark as complete action
          },
          child: const Text('Mark as Complete'),
        ),
      ],
    );
  }
}
