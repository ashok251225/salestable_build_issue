import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salestable/components/notifications/notification_card_model.dart';
import 'package:salestable/controllers/notification_count_controller.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/core/support/support.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import 'package:salestable/models/notifications_count_response.dart';
import 'package:salestable/models/notifications_response.dart';
import 'package:salestable/core/shared/snackbars/success_snackbar.dart';
import '../../core/flutter_flow/flutter_flow_theme.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key, required this.list, required int id});

  final ListElement list;

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  late NotificationModel _model;
  bool _isRead = false;
  final NotificationsCountController notificationsController =
      Get.put(NotificationsCountController());

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());
    _isRead = widget.list.status == 1;
  }

  Future<void> fetchNotificationsCountData() async {
    final NotificationCountResponse currentNotificationCount =
        await _model.fetchNotificationCount();

    notificationsController.setNotificationsCountData(currentNotificationCount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.06,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: widget.list.type == "user"
                      ? ImageComponent(
                          hasData: widget.list.fromUser.profilePic.isNotEmpty,
                          imageUrl: widget.list.fromUser.profilePic,
                        )
                      : SvgPicture.asset(
                          "assets/images/system_notification.svg",
                          fit: BoxFit.contain,
                          height: 10,
                          width: 10,
                        ),
                )
              ],
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).cardColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .trainingCardBorder,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Text(
                                    widget.list.message,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _isRead
                                      ? Colors.transparent
                                      : Colors.yellow,
                                ),
                              ),
                              !_isRead
                                  ? PopupMenuButton(
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 22,
                                      ),
                                      surfaceTintColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[
                                        PopupMenuItem<String>(
                                          value: "mark as read",
                                          height: 25,
                                          child: Row(
                                            children: [
                                              if (!_isRead)
                                                Text(
                                                  'Mark as Read',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                            ],
                                          ),
                                        ),
                                        PopupMenuDivider(),
                                        PopupMenuItem<String>(
                                          value: "delete",
                                          height: 25,
                                          child: Row(
                                            children: [
                                              Text(
                                                'Delete',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      onSelected: (String value) async {
                                        if (value == 'delete') {
                                          await _model.deleteNotification(
                                              id: widget.list.id.toString());
                                          await fetchNotificationsCountData();

                                          // ignore: use_build_context_synchronously

                                          Navigator.pushReplacementNamed(
                                              context, '/notification');

                                          setState(() {});
                                          if (_model.statusCode == 200) {
                                            successSnackBar(_model.message);
                                          }
                                        }
                                        if (value == 'mark as read') {
                                          await _model.makeAsReadNotification(
                                              notification_id: widget.list.id,
                                              status: 1);
                                          await fetchNotificationsCountData();
                                          setState(() {
                                            _isRead = true;
                                          });
                                        }
                                      },
                                      position: PopupMenuPosition.under,
                                    )
                                  : PopupMenuButton(
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 22,
                                      ),
                                      surfaceTintColor: Colors.white,
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[
                                        PopupMenuItem<String>(
                                          value: "delete",
                                          height: 25,
                                          child: Row(
                                            children: [
                                              Text(
                                                'Delete',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      onSelected: (String value) async {
                                        if (value == 'delete') {
                                          await _model.deleteNotification(
                                              id: widget.list.id.toString());

                                          // ignore: use_build_context_synchronously
                                          Navigator.pushReplacementNamed(
                                              context, '/notification');

                                          setState(() {});
                                          if (_model.statusCode == 200) {
                                            successSnackBar(_model.message);
                                          }
                                        }
                                      },
                                      position: PopupMenuPosition.under,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: SmallStyleTitle(
                              text: Support.formatTimeAgo(
                                widget.list.createdAt,
                              ),
                              fontSize: 12,
                              color: FlutterFlowTheme.of(context).smallText)),
                    ],
                  ),
                ].divide(const SizedBox(height: 6)),
              ),
            ),
          ].divide(const SizedBox(width: 10)),
        ),
      ),
    );
  }
}
