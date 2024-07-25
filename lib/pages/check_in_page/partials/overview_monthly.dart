import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/checkIn_page/overview_sales/monthly_overview_card.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../models/current_check_in_response.dart';
import '../../../core/shared/data_component.dart';

class MonthlyOverView extends StatelessWidget {
  const MonthlyOverView({super.key, required this.salesGoals});
  final List<Goal>? salesGoals;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SvgPicture.asset(
                  'assets/images/Target Icon.svg',
                  fit: BoxFit.cover,
                  color: FlutterFlowTheme.of(context).checkinTitleColor1,
                ),
              ),
              Expanded(
                child: Text(
                  'Sales Goals',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).checkinTitleColor1,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily,
                        ),
                      ),
                ),
              ),
            ].divide(const SizedBox(width: 8)),
          ),
          DataComponent(
              hasData: salesGoals!.isNotEmpty,
              noDataPath: 'assets/images/no_checkin.svg',
              noDataText: "No Checkin",
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust as needed
                    childAspectRatio: 4 / 2.6,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: salesGoals!.length,
                itemBuilder: (context, index) => MonthlyOverviewCard(
                  salesGoals: salesGoals![index],
                ),
              )),
        ].divide(const SizedBox(
          height: 12,
        )));
  }
}
