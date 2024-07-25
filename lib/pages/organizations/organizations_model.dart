import 'package:salestable/backend/custom_response.dart';

import 'package:salestable/backend/services/select_org_api.dart';
import 'package:salestable/models/select_organization_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'organizations_widget.dart' show OrganizationsWidget;
import 'package:flutter/material.dart';

class OrganizationsModel extends FlutterFlowModel<OrganizationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  bool error = false;
  int statusCode = 0;

  String message = '';

  @override
  void initState(BuildContext context) {}

  @override
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
        GetHelper.setOrgAccessToken(response.data!.data.access);

        break;

      default:
        message = response.data!.message.toString();

        error = true;
    }
  }
}
