import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salestable/controllers/pulse_controller.dart';
import 'package:salestable/core/dropdown_search/dropdown_sheet_container.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';

class FormDropDown extends StatefulWidget {
  // final TextEditingController controller;
  final Color? borderColor;
  final List<dynamic> items;
  final Function(String?) onChanged;
  final String searchHintText;
  final String? defaultValue;
  final double width;
  final double height;
  final IconData? icon;
  final String? path;
  final String? errorKey;
  final dynamic errors;

  const FormDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.searchHintText,
    this.defaultValue,
    this.borderColor,
    this.width = 100,
    this.height = 45,
    this.icon,
    this.path,
    this.errorKey,
    this.errors,
  });

  @override
  State<FormDropDown> createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {
  final TextEditingController searchController =
      TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  bool haserrorKey() {
    if (widget.errors != null) {
      return true;
    }
    return false;
  }

  String result() {
    if (haserrorKey()) {
      var data = widget.errors;
      return error(data, widget.errorKey);
    }
    return '';
  }

  String error(Map<String, dynamic> instance, String? errork) {
    for (var entries in instance.entries) {
      if (entries.key == errork) {
        return entries.value ?? '';
      }
    }
    return '';
  }

  final PulseController controller = Get.put(PulseController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetBuilder<PulseController>(
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    controller.selectedUsername,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).regularTitleWhite,
                        ),
                  ),
                ].divide(const SizedBox(width: 8)),
              ),
            ),
          );
        },
      ),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          context: context,
          builder: (modelContext) {
            return DropDownSheetContainer(
              options: widget.items,
              onChanged: (String value) {
                widget.onChanged(value);
                Navigator.of(context).pop();
              },
            );
          },
        );
        setState(() {});
      },
    );
  }
}
