import '../core/flutter_flow/flutter_flow_theme.dart';
import '../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({
    super.key,
    String? lable,
    String? details,
  })  : lable = lable ?? 'lable',
        details = details ?? 'Details';

  final String lable;
  final String details;

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.lable,
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.details,
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ].divide(const SizedBox(height: 8)),
      ),
    );
  }
}
