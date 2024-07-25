// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salestable/pages/pulse/partials/latest_posts_widget.dart';
import 'package:salestable/core/bottom_navigation_bar.dart';
import 'package:salestable/models/plus_post_response.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/page_header.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/pages/pulse/partials/pulse_tabbar.dart';
import '../../controllers/pulse_controller.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'add_post/partials/add_pulse_opener.dart';
import 'partials/pinned_posts_widget.dart';
import 'pulse_model.dart';

export 'pulse_model.dart';

class PulseWidget extends StatefulWidget {
  const PulseWidget({super.key});

  @override
  _PulseWidgetState createState() => _PulseWidgetState();
}

class _PulseWidgetState extends State<PulseWidget>
    with TickerProviderStateMixin {
  late PulseModel _model;
  late Future<void> data;
  num currentTabIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final PulseController _pulseController = Get.put(PulseController());
  final PulseController _findPulseController = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PulseModel());
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
    );
    data = fetchData();
    _scrollController.addListener(_loadMoreItems);
  }

  @override
  void dispose() {
    _model.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreItems() {
    if (_model.current_page != _model.total_pages) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!_pulseController.isFetchingData) {
          _pulseController.updatehasMoreLoading(true);
          _pulseController.updatePageValue(_pulseController.page + 1);
          fetchData().then((_) {
            _pulseController.updatehasMoreLoading(false);
            _pulseController.updateisFetchingData(false);
          });
        }
      }
    }
  }

  Future<List<ListElement>> fetchData() async {
    _pulseController.updateisFetchingData(true);
    try {
      await Future.wait([
        _model.fetchListUsers(),
        _model.fetchPostCount(),
        _model.fetchPinnedPost(),
        _model.fetchPlusPostdetails(
            page: _pulseController.page.toString(),
            user: _findPulseController.user,
            category: _findPulseController.category),
      ]);
      _pulseController.updateNewPulse(_findPulseController.pulseList);
      return _pulseController.newPulse;
    } finally {
      _pulseController.updatehasMoreLoading(false);
      _pulseController.updateisFetchingData(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: false,
        child: SafeArea(
          child: Scaffold(
              bottomNavigationBar: const BottomNavigation(activeIndex: 2),
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              floatingActionButton:
                  currentTabIndex == 0 ? const AddPulseOpener() : Container(),
              body: FutureBuilder(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingAll();
                    } else if (snapshot.hasError) {
                      return SnapshotErrorHandler(snapshot: snapshot);
                    } else {
                      return Stack(
                        children: [
                          const PageHeader(pageTitle: 'Pulse'),
                          Padding(
                            padding: const EdgeInsets.only(top: 62),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 16.0, 12.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).cardColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      PulseTabbar(
                                        controller: _model.tabBarController!,
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            LatestPostsWidget(
                                              onCategoryUpdate: (
                                                  {category = '',
                                                  page = '',
                                                  user = ''}) async {
                                                await _model
                                                    .fetchPlusPostdetails(
                                                        page: page,
                                                        user: user,
                                                        category: category);
                                              },
                                              onUserUpdate: (
                                                  {category = '',
                                                  page = '',
                                                  user = ''}) async {
                                                await _model
                                                    .fetchPlusPostdetails(
                                                        page: page,
                                                        user: user,
                                                        category: category);
                                              },
                                              userNames: _model.userNames,
                                              countData: _model.countData,
                                              scrollController:
                                                  _scrollController,
                                            ),
                                            PinnedPostsWidget(
                                                pinnedList: _model.pinnedList,
                                                onRefresh: () async {
                                                  await _model
                                                      .fetchPinnedPost();
                                                })
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
