// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salestable/components/notifications/notification_card_widget.dart';
import 'package:salestable/controllers/notification_controller.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/shared/buttons/submit_button.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import 'package:salestable/models/notifications_response.dart';
import 'package:salestable/core/shared/data_component.dart';
import 'package:salestable/core/shared/loading_for_all.dart';
import 'package:salestable/core/shared/snapshoterror_handler.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<void> _dataFetchingFuture;
  final NotificationController _notificationController =
      Get.put(NotificationController());
  final ScrollController _scrollController = ScrollController();

  var notificatiof = ['All,Unread,Dismissed'];

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => NotificationsModel());
    _dataFetchingFuture = fetchData();

    _scrollController.addListener(_loadMoreItems);
  }

  void _loadMoreItems() {
    if (_model.current_page != _model.total_pages) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!_notificationController.isFetchingData) {
          _notificationController.updatehasMoreLoading(true);
          _notificationController
              .updatePageValue(_notificationController.page + 1);

          fetchData().then((_) {
            _notificationController.updatehasMoreLoading(false);
            _notificationController.updateisFetchingData(false);
          });
        }
      }
    }
  }

  Future<List<ListElement>> fetchData() async {
    _notificationController.updateisFetchingData(true);
    try {
      await Future.wait([
        _model.fetchNotificationDetails(
            page: _notificationController.page.toString()),
      ]);
      _notificationController.updateNewNotifications(_model.notificationList);

      return _notificationController.newNotification;
    } finally {
      _notificationController.updatehasMoreLoading(false);
      _notificationController.updateisFetchingData(false);
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
        // ignore: deprecated_member_use
        child: PopScope(
          canPop: false,
          child: SafeArea(
            child: Scaffold(
              // bottomNavigationBar: const BottomNavigation(activeIndex: 4),
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: GetHelper.getIsReady()
                  ? FutureBuilder(
                      future: _dataFetchingFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: LoadingAll(),
                          );
                        } else if (snapshot.hasError) {
                          return SnapshotErrorHandler(snapshot: snapshot);
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .cardColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 9,
                                            color: Color(0x15000000),
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                      ),
                                      child: Stack(
                                        alignment:
                                            const AlignmentDirectional(1, -1),
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: SvgPicture.asset(
                                              'assets/images/Notification_Nav.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12, 8, 12, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_back_rounded,
                                                  ),
                                                ),
                                                Text(
                                                  'Notifications',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_back_rounded,
                                                    color: Colors.white,
                                                    size: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GetBuilder<NotificationController>(
                                builder: (_notificationController) =>
                                    DataComponent(
                                        hasData: _notificationController
                                            .newNotification.isNotEmpty,
                                        noDataPath:
                                            'assets/images/no_notification.svg',
                                        noDataText: "No notifications",
                                        child: Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12, 16, 12, 0),
                                            child: ListView.builder(
                                              controller: _scrollController,
                                              itemCount: _notificationController
                                                  .newNotification.length,
                                              itemBuilder: (context, index) =>
                                                  Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20),
                                                child: NotificationCard(
                                                  list: _notificationController
                                                      .newNotification[index],
                                                  id: _notificationController
                                                      .newNotification[index]
                                                      .id,
                                                ),
                                              ),
                                              shrinkWrap: true,
                                            ),
                                          ),
                                        )),
                              ),
                              GetBuilder<NotificationController>(
                                builder: (_notificationController) {
                                  if (_notificationController
                                      .ishasMoreLoading) {
                                    return const Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 40),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFF0494FD),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox(); // Return an empty widget if not loading
                                  }
                                },
                              )
                            ],
                          );
                        }
                      })
                  : Column(
                      children: [
                        Row(
                          children: [
                            BackButton(
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/no_notification.svg",
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                              MediumStyleTitle(
                                text: "No Notifications",
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              SmallStyleTitle(
                                fontSize: 12,
                                text: "Currently, you've no notifications",
                                color: FlutterFlowTheme.of(context).smallText,
                              ),
                              SubmitButton(
                                  Width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  label: "Go to Home",
                                  onPressed: () =>
                                      Get.toNamed(Routes.dashboard))
                            ].divide(
                              const SizedBox(height: 12),
                            ),
                          ),
                        ),
                        const Spacer(),
                        BackButton(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ],
                    ),
            ),
          ),
        ));
  }
}
