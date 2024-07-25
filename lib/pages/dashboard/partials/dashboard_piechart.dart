import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import 'package:salestable/models/get_post_count_response.dart';

class DashboardPiechart extends StatelessWidget {
  const DashboardPiechart({Key? key, required this.countData});

  final CountData countData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).piebackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: FlutterFlowTheme.of(context).dividerColor, width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 27),
              child: MediumStyleTitle(
                text: 'Pulse',
                fontSize: 17,
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              )),
          countData.totalUserPosts > 0
              ? AspectRatio(
                  aspectRatio: 2,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(),
                      sections: countData.categories.map((category) {
                        return PieChartSectionData(
                          // badgePositionPercentageOffset: 1.6,
                          // badgeWidget: SvgPicture.network(
                          //   category.category.pictureIcon,
                          //   fit: BoxFit.cover,
                          //   height: 15,
                          //   width: 15,
                          // ),
                          showTitle: true,
                          color: Color(int.tryParse(category.category.colorCode
                              .replaceAll('#', '0xFF'))!),
                          value: category.userPostCount.toDouble(),
                          title: '',
                          radius: 20,
                          titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: FlutterFlowTheme.of(context).smallText),
                        );
                      }).toList(),
                    ),
                  ),
                )
              : Column(
                  children: [
                  SvgPicture.asset(
                    'assets/images/No_Data_Pie_chart.svg',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  MediumStyleTitle(text: "No Posts Yet")
                ].divide(const SizedBox(height: 8))),
          countData.totalUserPosts > 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumStyleTitle(text: 'Total Posts : '),
                      MediumStyleTitle(
                          text: countData.totalUserPosts.toString()),
                    ],
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              childAspectRatio: 7 / 1.5,

              shrinkWrap: true, // Wrap content
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              children: [
                for (int i = 0; i < countData.categories.length; i++)
                  Row(
                      children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: SvgPicture.network(
                        countData.categories[i].category.pictureIcon,
                        fit: BoxFit.cover,
                        height: 16,
                      ),
                    ),
                    MediumStyleTitle(
                      text: countData.categories[i].category.name,
                      color: FlutterFlowTheme.of(context).smallText,
                      fontSize: 13,
                    ),
                    MediumStyleTitle(
                      text: '${countData.categories[i].userPostCount}',
                      color: FlutterFlowTheme.of(context).smallText,
                      fontSize: 13,
                    )
                  ].divide(const SizedBox(width: 8))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
