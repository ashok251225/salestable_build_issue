import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_theme.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';

class ProfilePropertyCard extends StatefulWidget {
  const ProfilePropertyCard(
      {super.key,
      required this.label,
      required this.title,
      required this.proIcon});

  final String label;
  final String title;
  final IconData proIcon;

  @override
  State<ProfilePropertyCard> createState() => _ProfilePropertyCardState();
}

class _ProfilePropertyCardState extends State<ProfilePropertyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                widget.label,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).titleMediumFamily,
                      color: FlutterFlowTheme.of(context).mediumText,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleMediumFamily),
                    ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  widget.proIcon,
                  color: FlutterFlowTheme.of(context).iconColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyLargeFamily,
                        color: FlutterFlowTheme.of(context).smallText,
                        fontSize: 14,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyLargeFamily),
                      ),
                ),
              ]..divide(const SizedBox(width: 10)),
            ),
            FaIcon(
              FontAwesomeIcons.angleRight,
              color: FlutterFlowTheme.of(context).iconColor,
              size: 16.5,
            ),
          ],
        ),
      ].divide(const SizedBox(height: 16)),
    );
  }
}
