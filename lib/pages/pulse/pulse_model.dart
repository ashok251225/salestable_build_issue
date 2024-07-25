// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salestable/backend/custom_response.dart';
import 'package:salestable/backend/services/pulse_apis/List_user_api.dart';
import 'package:salestable/backend/services/pulse_apis/get_pinned_post_api.dart';
import 'package:salestable/backend/services/pulse_apis/get_post_count_api.dart';
import 'package:salestable/backend/services/pulse_apis/plus_post_api.dart';
import 'package:salestable/controllers/pulse_controller.dart';
import 'package:salestable/core/shared/get_storage/get_storage_helper.dart';
import 'package:salestable/models/get_post_count_response.dart';
import 'package:salestable/models/list_users_response.dart';
import 'package:salestable/models/plus_post_response.dart';
import 'package:salestable/models/pulse_pinnedpost_response.dart';
import '../../core/flutter_flow/flutter_flow_util.dart';
import 'pulse_widget.dart' show PulseWidget;

class PulseModel extends FlutterFlowModel<PulseWidget> {
  ///  State fields for stateful widgets in this page.

  late List<ListPinnedElement> pinnedList;

  List<PulseUser> userslist = [];
  FocusNode? textFieldFocusNode;
  num filter_total_pages = 0;
  num filter_per_page = 0;
  num filter_current_page = 0;
  num filter_total_items = 0;
  final unfocusNode = FocusNode();
  num total_pages = 0;
  num per_page = 0;
  num current_page = 0;
  num total_items = 0;
  // Model for NotificationBell component.

  late CountData countData;
  List<CategoryElement> categoryData = [];
  List<ListUsers> listofUsers = [];
  List<ListUsers> totalListofUsers = [];
  List<PulseUser> pulseUsers = [];

  List<String> userNames = [];

  // State field(s) for TabBar widget.
  TabController? tabBarController;

  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.
  final PulseController pulseController = Get.put(PulseController());
  @override
  void initState(BuildContext context) {
    pinnedList = [];
    categoryData = [];
  }

  @override
  void dispose() {
    unfocusNode.dispose();

    tabBarController?.dispose();
  }

  Future<void> fetchListUsers({String page = ''}) async {
    try {
      CustomResponse<ListusersResponse> response =
          await ListUsersApi().call(page: page);

      if (response.statusCode == 200) {
        Userslist usersdata = response.data!.data;
        listofUsers.addAll(usersdata.list);
        totalListofUsers.addAll(listofUsers);

        userNames = totalListofUsers
            .map((e) => "${e.user.firstName.trim()} ${e.user.lastName.trim()}")
            .toSet()
            .toList()
          ..sort();

        // Add "All users" if not present
        if (!userNames.contains("All users")) {
          userNames.add("All users");
          userNames.sort();
        }
        // Assuming userNames is a list of strings

        String currentUserFullName =
            "${GetHelper.getUserFirstName()} ${GetHelper.getUserLastName()}";

        int index =
            userNames.indexWhere((e) => e.trim() == currentUserFullName.trim());

        if (index != -1) {
          userNames[index] = "My posts";
        } else {
          // If the current user's name is not found in userNames, add "My posts"
          userNames.add("My posts");
        }

        userNames.remove("All users");
        userNames.remove("My posts");

// Sort the userNames list
        userNames.sort();

// Insert "All Users" at the 0th index
        userNames.insert(0, "All users");

// Insert "My posts" at the 1st index
        userNames.insert(1, "My posts");

        // Update filter pages
        filter_total_pages = usersdata.pagination.numberOfPages;
        filter_current_page = usersdata.pagination.currentPage;

        // Fetch next page if available
        if (filter_current_page != filter_total_pages) {
          await fetchListUsers(page: (filter_current_page + 1).toString());
        }
      } else {
        // Handle non-200 status code
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle other errors such as network issues
      print('Error: $error');
    }
  }

  Future<List<ListElement>> fetchPlusPostdetails(
      {required String page,
      required String user,
      required String category}) async {
    String useruuid = '';

    if (user != "All users" && user != "My posts") {
      String inputString = user;
      int indexOfSpace = inputString.indexOf(" ");

      String part1 = inputString.substring(0, indexOfSpace);
      String part2 = inputString.substring(indexOfSpace + 1);

      useruuid = totalListofUsers
          .firstWhere(
            (element) =>
                (element.user.firstName.trim() == part1.trim()) &&
                element.user.lastName.trim() == part2.trim(),
          )
          .user
          .uuid;
    }
    if (user == "My posts") {
      useruuid = GetHelper.getUserId();
    }
    if (user == "All users") {
      useruuid = "all";
    }

    CustomResponse<Pluspostresponse> response = await getpluslistpostapi()
        .call(page: page, user: useruuid, category: category);
    if (response.statusCode == 200) {
      pulseController.pulseList = response.data!.data.list;
      total_pages = response.data!.data.pagination.numberOfPages;
      per_page = response.data!.data.pagination.perPage;
      current_page = response.data!.data.pagination.currentPage;
      total_items = response.data!.data.pagination.total;
    }
    return pulseController.pulseList;
  }

  Future<void> fetchPinnedPost() async {
    CustomResponse<PinnedPostResponse> response =
        await GetPinnedPostApi().call();
    if (response.statusCode == 200) {
      pinnedList = response.data!.data.list;
    }
  }

  Future<void> fetchPostCount() async {
    CustomResponse<PulsePostCountResponse> response =
        await GetPostCountAPI().call();
    if (response.statusCode == 200) {
      countData = response.data!.data;
      categoryData = countData.categories;
    }
  }
}
