// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numeral/numeral.dart';
import 'package:salestable/core/Dto/check_in_DTO.dart';
import '../../../core/forms/form_text_field.dart';
import '../../../core/texts/medium_style_title.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';

class CheckinQuestion extends StatelessWidget {
  CheckinQuestion(
      {super.key, required this.category, required this.controllers});
  final CategoryDTO category;
  List<TextEditingController>? controllers = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: category.goals.map((goal) {
        TextEditingController controller = TextEditingController();

        controller.text = goal.target!.toInt().toString();

        controllers!.add(controller);

        return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: category.name != "HubSpot Integration"
                ? Padding(padding: const EdgeInsets.all(4),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            MediumStyleTitle(
                              fontSize: 14,
                              text: goal.checkinMessage != ''
                                  ? goal.checkinMessage
                                  : goal.name,
                              color: FlutterFlowTheme.of(context).mediumText,
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: const BoxDecoration(),
                          child: FormTextField(
                            onTap: () {
                              controller.text == '0'
                                  ? controller.clear()
                                  : controller.text = controller.text;
                            },
                  
                            labeltext: "Ex:${goal.expectedTarget.toInt()}",
                  
                            controller: controller, // Assign the controller
                            errorKey: "",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/Vector_(2).svg',
                                      fit: BoxFit.cover,
                                      color: FlutterFlowTheme.of(context)
                                          .gradientColor1,
                                    ),
                                  ),
                                  MediumStyleTitle(
                                    text: goal.checkinMessage ==
                                            "How much is the revenue?"
                                        ? "\$${goal.expectedTarget.numeral()}"
                                        : goal.expectedTarget.numeral(),
                                    color: FlutterFlowTheme.of(context).addPost,
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                  ),
                                ],
                              ),
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ],
                    ),
                )
                : null);
      }).toList(),
    );
  }
}
