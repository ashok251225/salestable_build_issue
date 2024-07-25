import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/plus_post_response.dart';

class PulseController extends GetxController {
  int page = 1;
  String user = 'All users', category = '0';
  List<bool> isChipSelected = List.generate(6, (index) => false);

  String selectedCategory = '0';
  String selectedUsername = 'All users';
  bool isLoading = false,
      ishasMoreLoading = false,
      refreshindicator = false,
      isFetchingData = false;

  List<ListElement> newPulse = [];
  List<ListElement> pulseList = [];

  List<String> categories = [
    'Lessons Learned',
    'Best Practices',
    'Thoughts',
    'Daily Boosts',
    'Wins',
  ];

  void updateSelectedCategory(int index) {
    int adjustedIndex = index.isNegative ? 0 : index + 1;
    String newIndex = adjustedIndex.toString();

    if (selectedCategory == newIndex) {
      selectedCategory = '0';
      isChipSelected[index] = false;
    } else {
      selectedCategory = newIndex;

      for (int i = 0; i < isChipSelected.length; i++) {
        isChipSelected[i] = (i == index);
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void setSelectedUserName(String userName) {
    selectedUsername = userName;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void clearFilters() {
    selectedUsername = 'All users';

    isChipSelected = List.generate(6, (index) => false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updatehasMoreLoading(bool value) {
    ishasMoreLoading = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updaterefreshindicator(bool value) {
    refreshindicator = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updateisFetchingData(bool value) {
    isFetchingData = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updateisLoading(bool value) {
    isLoading = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updateNewPulse(List<ListElement> newPulseValue) {
    newPulse.addAll(newPulseValue);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updateNewPulsefromList(List<ListElement> newPulseValue) {
    newPulse = List.from(newPulseValue);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updatePageValue(int value) {
    page = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updateUserFilter(String _user) {
    user = _user;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updateCategoryFilter(String _category) {
    category = _category;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void clearNewpulseData() {
    newPulse.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  void updateSelectedcategory() {
    selectedCategory = '0';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }
}
