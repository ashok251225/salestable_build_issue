// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/core/support/support.dart';
import '../../core/shared/new_user_no_data.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'dashboard_model.dart';
import 'partials/dashboard_header.dart';
import 'partials/dashboard_piechart.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late Future<void> _modelFuture;
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    _modelFuture = fetchData();
  }

  Future<void> fetchData() async {
    await Future.wait([
      _model.fetchDateWiseCheckIn(
          date: Support.formatDate(value: DateTime.now().toString())),
      _model.fetchUserLimitation(),
      _model.fetchHomeCheckIn(),
      _model.fetchPostCount()
    ]);

    GetHelper.setIsReady(_model.isReady);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: PopScope(
          canPop: false,
          child: SafeArea(
            child: Scaffold(
              bottomNavigationBar: const BottomNavigation(activeIndex: 0),
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: FutureBuilder(
                  future: _modelFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingAll();
                    } else if (snapshot.hasError) {
                      return SnapshotErrorHandler(snapshot: snapshot);
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DashboardHeader(),
                            GetHelper.getIsReady()
                                ? DashboardPiechart(countData: _model.countData)
                                : Padding(
                                    padding: const EdgeInsets.only(top: 100.0),
                                    child: Column(
                                      children: [
                                        const NewUserNoData(
                                          noDataText: "",
                                        ),
                                      ].divide(
                                        SizedBox(
                                          height: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                          ].divide(const SizedBox(height: 32.0)),
                        ),
                      );
                    }
                  }),
            ),
          ),
        ));
  }
}
