import 'package:flutter/material.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/shared/buttons/cancel_button.dart';
import 'package:salestable/core/shared/buttons/submit_button.dart';

class DeleteConfirmation extends StatelessWidget {
  final String? content;
  final String? field;

  final VoidCallback onConfirm;

  const DeleteConfirmation({
    super.key,
    required this.content,
    required this.field,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: field == 'Images'
          ? Text(
              "Delete these $field ?",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.redAccent,
              ),
              textAlign: TextAlign.center,
            )
          : Text(
              "Delete this $field ?",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.redAccent,
              ),
              textAlign: TextAlign.center,
            ),
      content: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  children: [
                Text(
                  content ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
              ].divide(const SizedBox(
                height: 8,
              ))),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: CancelButton()),
                      Expanded(
                        child: SubmitButton(
                          label: "Delete",
                          onPressed: onConfirm,
                          color: const Color(0xFFD94841),
                        ),
                      )
                    ].divide(const SizedBox(width: 8))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
