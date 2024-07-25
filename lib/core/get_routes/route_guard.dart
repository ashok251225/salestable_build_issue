import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:salestable/core/get_routes/routes.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final accessToken = GetHelper.getAccessToken();
    final orgList = GetHelper.getOrgList();

    return accessToken.isNotEmpty && orgList.isNotEmpty
        ? const RouteSettings(name: Routes.organization)
        : null;
  }
}
