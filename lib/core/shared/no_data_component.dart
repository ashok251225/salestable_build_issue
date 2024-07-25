import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salestable/core/texts/medium_style_title.dart';

class NoDataComponent extends StatelessWidget {
  final String title;
  final bool hasSecondLine;
  final String? noDataPath;
  final double topPadding;
  const NoDataComponent(
      {this.title = 'No Data Available',
      this.noDataPath,
      required this.hasSecondLine,
      required this.topPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SvgPicture.asset(
              noDataPath.toString(),
              width: 150,
              height: 150,
            ),
            SizedBox(height: 12),
            MediumStyleTitle(
              text: title.toString(),
              color: Colors.grey,
              fontSize: 16,
            ),
            SizedBox(height: 12),
            hasSecondLine
                ? MediumStyleTitle(
                    text: "Please try with some other",
                    color: Colors.grey,
                    fontSize: 16,
                  )
                : Container(),
            SizedBox(height: 8),
            hasSecondLine
                ? MediumStyleTitle(
                    text: "post category and users",
                    color: Colors.grey,
                    fontSize: 16,
                  )
                : Container()
          ]),
        ));
  }
}
