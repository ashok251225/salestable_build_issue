import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/shared/buttons/cancel_button.dart';
import 'package:salestable/core/shared/buttons/submit_button.dart';

class PremiumFeaturePopUp extends StatelessWidget {
  const PremiumFeaturePopUp({
    super.key,
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
      title: Column(
          children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "This is a premium feature",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0494FD),
              ),
            ),
          ],
        ),
        const Text(
          "Please contact your organization owner if you want to access this feature.",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ].divide(const SizedBox(
        height: 10,
      ))),
      content: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 32, bottom: 0),
        child: SizedBox(
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CancelButton(
                        label: "Cancel",
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
