import 'package:salestable/backend/custom_response.dart';

import 'package:salestable/backend/services/auth_api.dart';
import 'package:salestable/backend/services/select_org_api.dart';
import 'package:salestable/backend/services/social_sign_in_api.dart';
import 'package:salestable/models/select_organization_response.dart';
import 'package:salestable/models/user_response.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';

import '../../core/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textEmailController;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textPasswordController;
  late bool passwordVisibility;

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  int checkboxValueNum = 0;

  bool isVisible = false;
  List<SelectOrganisation> organisations = [];

  bool error = false;
  bool isValidation = false;

  String message = '';
  String firstName = '';
  String lastName = '';
  String orgId = '';
  int statusCode = 0;
  int userType = 0;
  int orgLength = 0;
  List<Organisation> orgList = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    orgList = [];
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textEmailController?.dispose();

    textFieldFocusNode2?.dispose();
    textPasswordController?.dispose();
  }

  Future<void> signIn(
      {required String email,
      required String password,
      required int rememberMe}) async {
    GetHelper.setRememberMe(rememberMe);
    GetHelper.setUserPassword(password);
    CustomResponse<UserResponse> response = await SignInApi()
        .call(email: email, password: password, rememberMe: rememberMe);

    error = false;
    isValidation = false;
    message = '';

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;
        firstName = response.data!.data.user.firstName ?? '';
        lastName = response.data!.data.user.lastName ?? '';
        orgList = response.data!.data.organisations;
        orgLength = orgList.length;
        orgId = orgList.isNotEmpty ? orgList.first.slug : '';
        // num subValue =
        userType = orgList.isNotEmpty ? orgList.first.userRole : 0;

        String userEmail = response.data!.data.user.email ?? '';
        String timeZone = response.data!.data.user.timezone ?? '';
        String profilePic = response.data!.data.user.profilePic ?? '';

        String userUuid = response.data!.data.user.uuid ?? '';

        int userId = response.data!.data.user.id ?? 0;

        GetHelper.setUserId(userId.toString());
        GetHelper.setUserId(orgId);
        GetHelper.setOrgLength(orgLength);

        GetHelper.setProfilePic(profilePic);

        GetHelper.setOrgList(orgList);
        GetHelper.setTimeZone(timeZone);
        GetHelper.setUserFirstName(firstName);
        GetHelper.setUserLastName(lastName);
        GetHelper.setUserEmail(userEmail);
        GetHelper.setAccessToken(response.data!.data.access.toString());

        GetHelper.setUserId(userUuid);

        break;

      case 422:
        message = response.data!.message;
        isValidation = true;
        error = true;

      case 401:
        message = response.data!.message;
        isValidation = false;

        error = true;

        break;
      default:
        message = response.data!.message.toString();

        error = true;
    }
  }

  Future<void> signInWithSocialPlatform({
    required String accessToken,
    required String socialType,
  }) async {
    //GetHelper.setRememberMe(rememberMe);
    // GetHelper.setUserPassword(password);
    CustomResponse<UserResponse> response = await SocialSignInApi()
        .call(accessToken: accessToken, socialType: socialType);

    error = false;
    isValidation = false;
    message = '';

    switch (response.statusCode) {
      case 200:
      case 201:
        message = response.data!.message;
        statusCode = response.data!.statusCode;
        firstName = response.data!.data.user.firstName ?? '';
        lastName = response.data!.data.user.lastName ?? '';
        orgList = response.data!.data.organisations;
        orgLength = orgList.length;
        orgId = orgList.isNotEmpty ? orgList.first.slug : '';

        // num subValue =
        userType = orgList.isNotEmpty ? orgList.first.userRole : 0;

        print(
            "$userType  isssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");

        String userEmail = response.data!.data.user.email ?? '';
        String timeZone = response.data!.data.user.timezone ?? '';
        String profilePic = response.data!.data.user.profilePic ?? '';

        String userUuid = response.data!.data.user.uuid ?? '';

        int userId = response.data!.data.user.id ?? 0;

        GetHelper.setUserId(userId.toString());
        GetHelper.setUserId(orgId);
        GetHelper.setOrgLength(orgLength);

        GetHelper.setProfilePic(profilePic);
        GetHelper.setUserType(userType.toString());

        GetHelper.setOrgList(orgList);
        GetHelper.setTimeZone(timeZone);
        GetHelper.setUserFirstName(firstName);
        GetHelper.setUserLastName(lastName);
        GetHelper.setUserEmail(userEmail);
        GetHelper.setAccessToken(response.data!.data.access.toString());

        GetHelper.setUserId(userUuid);

        break;

      case 422:
        message = response.data!.message;
        isValidation = true;
        error = true;

      case 401:
        message = response.data!.message;
        isValidation = false;

        error = true;

        break;
      default:
        message = response.data!.message.toString();

        error = true;
    }
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
        GetHelper.setDesignation(response.data!.data.user.designation);
        GetHelper.setOrgId(response.data!.data.organisations.first.logo);
        GetHelper.setOrgName(response.data!.data.organisations.first.name);

        GetHelper.setOrgLogo(response.data!.data.organisations.first.logo);
        organisations = response.data!.data.organisations;
        int subValue = organisations.first.subscriptionStatus.value;

        GetHelper.setSubscriptionValue(subValue);

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
