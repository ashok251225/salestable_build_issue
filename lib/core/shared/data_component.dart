import 'package:flutter/material.dart';
import 'package:salestable/core/shared/loading.dart';
import 'package:salestable/core/shared/no_data_component.dart';

class DataComponent extends StatelessWidget {
  final bool isLoading;
  final bool hasData;
  final String? noDataText;
  final bool hasSecondLine;
  final Widget child;
  final String? noDataPath;
  final double? topPadding;

  const DataComponent(
      {super.key,
      required this.hasData,
      required this.child,
      this.noDataPath,
      this.noDataText,
      this.isLoading = false,
      this.hasSecondLine = false,
      this.topPadding = 200});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Loading(loading: isLoading, child: Container());
    }
    if (!hasData) {
      return NoDataComponent(
          topPadding: topPadding!,
          title: noDataText.toString(),
          hasSecondLine: hasSecondLine,
          noDataPath: noDataPath!);
    }

    return child;
  }
}
