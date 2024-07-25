import 'package:flutter/material.dart';

import '../../../core/forms/form_text_field.dart';

class CheckinTextField extends StatelessWidget {
  const CheckinTextField(
      {super.key,
      required this.controller,
      required this.question,
      required this.qHint});
  final String question, qHint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return FormTextField(
      borderRadius: 8,
      label: question,
      hasDigitsonly: false,
      textInputType: TextInputType.name,
      controller: controller,
      maxLines: 2,
      labeltext: qHint,
    );
  }
}
