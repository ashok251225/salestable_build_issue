import 'package:salestable/backend/custom_response.dart';

import 'package:salestable/backend/services/select_org_api.dart';
import 'package:salestable/components/select_organization_widget_card.dart';
import 'package:salestable/models/select_organization_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../core/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SelectOrganizationCardModel
    extends FlutterFlowModel<SelectOrganizationCardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<SelectOrganisation> organisations = [];

  bool error = false;
  int statusCode = 0;

  String message = '';

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  Future<void> selectOrganization({required String orgId}) async {
    CustomResponse<SelectOrganizationResponse> response =
        await SelectOrgApi().call(orgId: orgId);

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;
        organisations = response.data!.data.organisations;

        int subValue = organisations
            .firstWhere((element) => element.slug == orgId)
            .subscriptionStatus
            .value;

        GetHelper.setSubscriptionValue(subValue);

        GetHelper.setOrgAccessToken(response.data!.data.access);
        GetHelper.setDesignation(response.data!.data.user.designation);

        break;

      case 1001:
        message = response.data!.message;
        break;

      default:
        message = response.data!.message.toString();

        error = true;
    }
  }
}
