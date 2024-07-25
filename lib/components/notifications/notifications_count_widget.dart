// ignore_for_file: library_private_types_in_public_api

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:salestable/controllers/notification_count_controller.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/models/notifications_count_response.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'notifications_count_model.dart';

export 'notifications_count_model.dart';

class NotificationsCountWidget extends StatefulWidget {
  const NotificationsCountWidget({super.key});

  @override
  _NotificationsCountWidgetState createState() =>
      _NotificationsCountWidgetState();
}

class _NotificationsCountWidgetState extends State<NotificationsCountWidget> {
  late NotificationCountModel _model;
  late Future<void> _futuredat;

  final NotificationsCountController notificationsController =
      Get.put(NotificationsCountController());

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationCountModel());
    _futuredat = fetchdata();
  }

  Future<void> fetchdata() async {
    await fetchNotificationsCountData();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Future<void> fetchNotificationsCountData() async {
    final NotificationCountResponse currentNotificationCount =
        await _model.fetchNotificationCount();

    notificationsController.setNotificationsCountData(currentNotificationCount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Color.fromARGB(0, 255, 255, 255),
        shape: BoxShape.circle,
      ),
      child: FutureBuilder(
          future: _futuredat,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset(
                    'assets/lottie_animations/Notification_bell.json',
                    width: 50,
                    height: 50),
              );
            } else if (snapshot.hasError) {
              return Container();
            } else {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/notification');
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/bell-simple.svg',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GetHelper.getIsReady()
                      ? Obx(() {
                          return notificationsController
                                      .notificationsCountData.data !=
                                  0
                              ? Positioned(
                                  top: notificationsController
                                              .notificationsCountData.data
                                              .toString()
                                              .length >=
                                          2
                                      ? 1
                                      : 3,
                                  right: notificationsController
                                              .notificationsCountData.data
                                              .toString()
                                              .length >=
                                          2
                                      ? 2
                                      : 8,
                                  child: badges.Badge(
                                    badgeContent: Text(
                                      notificationsController
                                          .notificationsCountData.data
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            fontSize: 10,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                  ),
                                )
                              : Container();
                        })
                      : Container()
                ],
              );
            }
          }),
    );
  }
}
