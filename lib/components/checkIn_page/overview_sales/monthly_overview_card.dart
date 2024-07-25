import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/models/current_check_in_response.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeral/numeral.dart';

class MonthlyOverviewCard extends StatelessWidget {
  const MonthlyOverviewCard({super.key, required this.salesGoals});
  final Goal salesGoals;

  String proIcon() {
    if (salesGoals.name == "No. of customers") {
      return "no_of_customers.svg";
    } else if (salesGoals.name == "Revenue") {
      return 'revenue.svg';
    } else {
      return 'test_icon.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).checkinCardColor1,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: SvgPicture.asset(
                        'assets/images/${proIcon()}',
                        height: 16,
                        width: 16,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: MediumStyleTitle(
                    fontSize: 14,
                    text: salesGoals.name,
                    color: FlutterFlowTheme.of(context).smallText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
                children: [
              _buildSection(context, 'Achieved', salesGoals.target!),
              _buildSection(context, 'Target', salesGoals.expectedTarget),
            ].divide(const SizedBox(
              width: 30,
            ))),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, num value) {
    final formattedValue = (value < 1000)
        ? value.toInt().toString()
        : value.toInt().numeral().toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                color: FlutterFlowTheme.of(context).smallText,
                fontWeight: FontWeight.normal,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                  FlutterFlowTheme.of(context).bodySmallFamily,
                ),
              ),
        ),
        Text(
          (salesGoals.name == 'Revenue') ? '\$$formattedValue' : formattedValue,
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                color: FlutterFlowTheme.of(context).mediumText,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                  FlutterFlowTheme.of(context).titleMediumFamily,
                ),
              ),
        ),
      ],
    );
  }
}
