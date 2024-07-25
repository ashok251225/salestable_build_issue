import 'package:flutter/material.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/shared/buttons/cancel_button.dart';
import 'package:salestable/core/shared/buttons/submit_button.dart';

class LogoutConfirmation extends StatelessWidget {
  final String? field;

  final VoidCallback onConfirm;

  const LogoutConfirmation({
    super.key,
    required this.field,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: Text(
        "$field?",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF0494FD),
        ),
        textAlign: TextAlign.center,
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 32, bottom: 0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ignore: prefer_const_constructors
                      Expanded(
                          child: const CancelButton(
                        label: 'No',
                      )),
                      Expanded(
                        child: SubmitButton(
                          label: "Yes",
                          onPressed: onConfirm,
                          color: const Color(0xFF0494FD),
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
