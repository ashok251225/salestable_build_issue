import 'package:flutter/material.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/models/get_goals_response.dart';
import 'package:salestable/pages/check_in_page/partials/daily_sales%20.dart';
import 'package:salestable/pages/check_in_page/partials/monthly_sales.dart';

class SalesGoalsTargets extends StatelessWidget {
  const SalesGoalsTargets(
      {super.key,
      required this.dailySalesActivity,
      required this.dailyDescription,
      required this.monthlySalesGoals,
      required this.monthlyDescription});
  final String dailyDescription;
  final List<DataOFGoal> dailySalesActivity;
  final List<DataOFGoal> monthlySalesGoals;
  final String monthlyDescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: FlutterFlowTheme.of(context).primaryBackground),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              MonthlySales(
                monthlySalesGoals: monthlySalesGoals,
                description: monthlyDescription,
              ),
              DailySales(
                description: dailyDescription,
                dailySalesActivity: dailySalesActivity,
              )
            ].divide(const SizedBox(height: 32)),
          ),
        ),
      ),
    );
  }
}
