import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/models/get_goals_response.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeral/numeral.dart';

class MonthlySalesCard extends StatelessWidget {
  const MonthlySalesCard({super.key, required this.monthlySalesGoals});

  final DataOFGoal monthlySalesGoals;

  String proIcon() {
    if (monthlySalesGoals.name == "No. of customers") {
      return "no_of_customers.svg";
    } else if (monthlySalesGoals.name == "Revenue") {
      return 'revenue.svg';
    } else {
      return 'test_icon.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x06000000),
            offset: Offset(0, 4),
          )
        ],
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).checkinCardColor1,
            FlutterFlowTheme.of(context).checkinCardColor1,
          ],
          stops: const [0, 1],
          begin: const AlignmentDirectional(0.03, 1),
          end: const AlignmentDirectional(-0.03, -1),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
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
                      Expanded(
                          child: MediumStyleTitle(
                        text: monthlySalesGoals.name!,
                        fontSize: 14,
                        color: FlutterFlowTheme.of(context).smallText,
                      )),
                    ].divide(const SizedBox(width: 4)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Goal Target',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.normal,
                            color: FlutterFlowTheme.of(context).smallText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    monthlySalesGoals.target! <= 1000
                        ? Text(
                            monthlySalesGoals.name == "Revenue"
                                ? "\$${monthlySalesGoals.target!.toInt()}"
                                : monthlySalesGoals.target!.toInt().toString(),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      FlutterFlowTheme.of(context).mediumText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          )
                        : Text(
                            monthlySalesGoals.name == "Revenue"
                                ? "\$${monthlySalesGoals.target!.toInt().numeral()}"
                                : monthlySalesGoals.target!
                                    .toInt()
                                    .numeral()
                                    .toString(),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      FlutterFlowTheme.of(context).mediumText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          )
                  ].divide(const SizedBox(width: 5)),
                ),
              ].divide(const SizedBox(height: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
