import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:salestable/core/texts/medium_style_title.dart';

class SnapshotErrorHandler<T> extends StatelessWidget {
  const SnapshotErrorHandler(
      {super.key,
      required this.snapshot,
      this.height = 190,
      this.fontSize = 23});
  final AsyncSnapshot<T> snapshot;
  final double height;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: snapshot.error.toString().contains('Failed host lookup')
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/NoInternet1.svg',
                    height: height,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: MediumStyleTitle(
                      text: 'Network error',
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie_animations/No_Data.json',
                    width: 150,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: MediumStyleTitle(
                      text: 'No Data',
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // MediumStyleTitle(
                  //   text: 'error${snapshot.error}',
                  //   fontSize: 23,
                  //   fontWeight: FontWeight.w500,
                  // ),
                ],
              ));
  }
}
