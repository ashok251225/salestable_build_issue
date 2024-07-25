import 'package:get_storage/get_storage.dart';
import 'package:salestable/models/user_response.dart';

class GetHelper {
  static const String accessToken = 'access-token';
  static const String refreshToken = 'refresh-token';
  static const String userEmail = "email";
  static const String userFirstName = "user-first-name";
  static const String userLastName = "user-last-name";
  static const String orgAccessToken = "org-access-token";
  static const String rememberMe = "rememberMe";
  static const String timeZone = "timeZone";
  static const String orgList = "organizationsList";
  static const String orgId = "orgId";
  static const String profilePic = "profilePic";
  static const String attention = "attention";
  static const String designation = "designation";
  static const String userPassword = "userPassword";
  static const String userId = "userId";
  static const String postId = "postId";
  static const String listPostId = "listpostId";
  static const String hasReaction = "hasReaction";
  static const String category = "category";
  static const String categoryFilter = "categoryFilter";
  static const String userFilter = "userFilter";
  static const String orgLogo = "orgLogo";
  static const String orgName = "orgName";
  static const String moduleId = "moduleId";
  static const String contentId = "contentId";
  static const String orgLength = "orgLength";
  static const String checkinExisted = "checkinExisted";
  static const String isReady = "isReady";
  static const String isTrained = "isTrained";
  static const String isOnboarded = "isOnboarded";
  static const String eachContentId = "eachContentId";
  static const String subscriptionValue = "subscriptionValue";
  static const String hasCheckinData = "hasCheckinData";
  static const String userType = "userType";

  static final box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static String getUserType() => box.read(userType) ?? '';
  static void setUserType(String value) => box.write(userType, value);

  static String getAccessToken() => box.read(accessToken) ?? '';
  static void setAccessToken(String value) => box.write(accessToken, value);

  static String getRefreshToken() => box.read(refreshToken) ?? '';
  static void setRefreshToken(String value) => box.write(refreshToken, value);

  static String getUserEmail() => box.read(userEmail) ?? '';
  static void setUserEmail(String value) => box.write(userEmail, value);

  static String getUserFirstName() => box.read(userFirstName) ?? '';
  static void setUserFirstName(String value) => box.write(userFirstName, value);

  static String getUserLastName() => box.read(userLastName) ?? '';
  static void setUserLastName(String value) => box.write(userLastName, value);

  static String getOrgAccessToken() => box.read(orgAccessToken) ?? '';
  static void setOrgAccessToken(String value) =>
      box.write(orgAccessToken, value);

  static String getOrgName() => box.read(orgName) ?? '';
  static void setOrgName(String value) => box.write(orgName, value);

  static String getOrgLogo() => box.read(orgLogo) ?? '';
  static void setOrgLogo(String value) => box.write(orgLogo, value);

  static int getRememberMe() => box.read(rememberMe) ?? 0;
  static void setRememberMe(int value) => box.write(rememberMe, value);

  static String getTimeZone() => box.read(timeZone) ?? '';
  static void setTimeZone(String value) => box.write(timeZone, value);

  static String getOrgId() => box.read(orgId) ?? '';
  static void setOrgId(String value) => box.write(orgId, value);

  static String getProfilePic() => box.read(profilePic) ?? '';
  static void setProfilePic(String value) => box.write(profilePic, value);

  static String getAttention() => box.read(attention) ?? '';
  static void setAttention(String value) => box.write(attention, value);

  static String getDesignation() => box.read(designation) ?? '';
  static void setDesignation(String value) => box.write(designation, value);

  static String getUserPassword() => box.read(userPassword) ?? '';
  static void setUserPassword(String value) => box.write(userPassword, value);

  static String getUserId() => box.read(userId) ?? '';
  static void setUserId(String value) => box.write(userId, value);

  static String getPostId() => box.read(postId) ?? '';
  static void setPostId(String value) => box.write(postId, value);

  static String getModuleId() => box.read(moduleId) ?? '';
  static void setModuleId(String value) => box.write(moduleId, value);

  static String getContentId() => box.read(contentId) ?? '';
  static void setContentId(String value) => box.write(contentId, value);

  static int getOrgLength() => box.read(orgLength) ?? 0;
  static void setOrgLength(int value) => box.write(orgLength, value);

  static bool getCheckinExisted() => box.read(checkinExisted) ?? false;
  static void setCheckinExisted(bool value) => box.write(checkinExisted, value);

  static bool getIsReady() => box.read(isReady) ?? false;
  static void setIsReady(bool value) => box.write(isReady, value);

  static bool getIsTrained() => box.read(isTrained) ?? false;
  static void setIsTrained(bool value) => box.write(isTrained, value);

  static bool getIsOnboarded() => box.read(isOnboarded) ?? false;
  static void setIsOnboarded(bool value) => box.write(isOnboarded, value);

  static String getEachContentId() => box.read(eachContentId) ?? '';
  static void setEachContentId(String value) => box.write(eachContentId, value);

  static int getSubscriptionValue() => box.read(subscriptionValue) ?? 0;
  static void setSubscriptionValue(int value) =>
      box.write(subscriptionValue, value);

  static bool getHasCheckinData() => box.read(hasCheckinData) ?? false;
  static void setHasCheckinData(bool value) => box.write(hasCheckinData, value);

  static bool getReactionStatus() => box.read(hasReaction) ?? false;
  static void setReactionStatus(bool value) => box.write(hasReaction, value);

  static String getCategoryId() => box.read(category) ?? '';
  static void setCategoryId(String value) => box.write(category, value);

  static String getCategoryFilter() => box.read(categoryFilter) ?? '';
  static void setCategoryFilter(String value) =>
      box.write(categoryFilter, value);

  static String getUserFilter() => box.read(userFilter) ?? '';
  static void setUserFilter(String value) => box.write(userFilter, value);

  static List<String> getListPostIds() => box.read(listPostId) ?? [];
  static void setListPostIds(List<String> value) =>
      box.write(listPostId, value);

  static List<Organisation> getOrgList() => box.read(orgList) ?? [];
  static void setOrgList(List<Organisation> value) => box.write(orgList, value);

  static Future<void> remove(String key) async => await box.remove(key);
  static Future<void> clear() async => await box.erase();
}
