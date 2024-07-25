import 'package:flutter/material.dart';
import 'package:salestable/core/shared/image_component.dart';
import 'package:salestable/core/texts/large_style_title.dart';
import 'package:salestable/core/texts/medium_style_title.dart';
import 'package:salestable/core/texts/small_style_title.dart';
import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';
import '../../../components/dashboard/check_in_card.dart';
import '../../../components/notifications/notifications_count_widget.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/shared/get_storage/get_storage_helper.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Background_(4).png',
          ).image,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 28.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.06,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ImageComponent(
                                hasData: GetHelper.getProfilePic().isNotEmpty,
                                imageUrl: GetHelper.getProfilePic(),
                              )),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SmallStyleTitle(
                                    text:
                                        '${GetHelper.getUserFirstName()} ${GetHelper.getUserLastName()}',
                                    color: FlutterFlowTheme.of(context)
                                        .regularTitleWhite,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        MediumStyleTitle(text: ''),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                  ),
                  const NotificationsCountWidget(),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                LargeStyleTitle(
                  text: 'Welcome !',
                  color: FlutterFlowTheme.of(context).regularTitleWhite,
                  fontSize: 20.0,
                )
              ],
            ),
            (GetHelper.getIsReady() && GetHelper.getHasCheckinData())
                ? CheckInCard(
                    isCheckInExisted: GetHelper.getCheckinExisted(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
