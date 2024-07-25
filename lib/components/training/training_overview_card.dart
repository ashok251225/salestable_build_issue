import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';

class TrainingOverview extends StatelessWidget {
  const TrainingOverview({
    required this.title,
    required this.proIcon,
    required this.value,
  });

  final String title;
  final String proIcon;
  final value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            const BoxShadow(
              blurRadius: 9,
              color: Color(0x18000000),
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFFCEFFEC),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: SvgPicture.asset(
                          'assets/images/$proIcon.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  MediumStyleTitle(text: title),
                  // Text(
                  //   '$title',
                  //   style: FlutterFlowTheme.of(context).bodyMedium,

                  // ),
                ],
              ),
              MediumStyleTitle(text: value)
              // Text(
              //   '$value',
              //   style: FlutterFlowTheme.of(context).titleSmall,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
