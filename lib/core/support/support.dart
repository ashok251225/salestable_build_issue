import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salestable/controllers/pulse_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/snackbars/error_snackbar.dart';

class Support {
  static String currencyFormat({required String number}) {
    if (number.isEmpty) {
      return '';
    }
    var formatter = NumberFormat.currency(
        symbol: "\$", decimalDigits: 0, locale: 'en_US', name: 'USD');

    return formatter.format(int.tryParse(number));
  }

  static String numberFormat({required String number}) {
    if (number.isEmpty) {
      return '';
    }

    var formatter =
        NumberFormat.currency(symbol: '', decimalDigits: 0, locale: 'en_IN');

    return formatter.format(int.tryParse(number));
  }

  static String formatDuration(double seconds) {
    int minutes = seconds ~/ 60;
    int secondsRemaining = (seconds.toInt() % 60);

    return '${minutes.toString().padLeft(2, '0')}:${secondsRemaining.toString().padLeft(2, '0')}';
  }

  static String formatDate(
      {required String value, String format = 'yyyy-MM-dd'}) {
    var dateTime = DateTime.parse(value).toLocal();
    var formatter = DateFormat(format);
    return Intl.withLocale("en_IN", () => formatter.format(dateTime));
  }

  static Future<void> openUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url),
          mode: LaunchMode.externalApplication,
          webOnlyWindowName: 'Sales Table');
    } catch (e) {
      print(e);
    }
  }

  static String nullOrValue(String value) {
    if (value == 'null' || value.isEmpty) {
      return '';
    }
    return value;
  }

  static String filetoString(File? value) {
    if (value != File('') && value != null) {
      return value
          .toString()
          .trim()
          .split("File: ")
          .last
          .trim()
          .replaceAll("'", "");
    }
    return '';
  }

  static String formatTimeAgo(dynamic dateTimeInput) {
    DateTime dateTime;
    if (dateTimeInput is String) {
      dateTime = DateTime.parse(dateTimeInput);
    } else if (dateTimeInput is DateTime) {
      dateTime = dateTimeInput;
    } else {
      throw ArgumentError('Invalid input format. Expected String or DateTime.');
    }

    DateTime now = DateTime.now().toUtc();
    Duration difference = now.difference(dateTime);

    if (difference.inDays >= 365) {
      return DateFormat('dd MMMM, yyyy').format(dateTime);
    } else if (difference.inDays >= 30) {
      int months = difference.inDays ~/ 30;
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else if (difference.inHours > 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inHours == 1) {
      return '1h ago';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes} min ago';
    } else {
      return 'just now';
    }
  }

  static Future<void> hasInternet({var child}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      errorSnackBar('No internet!');
    }
    return child!;
  }

  final PulseController _pulseController = Get.put(PulseController());

  final PulseController _findPulseController = Get.find();

  Future<void> clearPulseFilters() async {
    await Future.microtask(() {
      _pulseController.updatePageValue(1);
    });
    await Future.microtask(() {
      _findPulseController.clearNewpulseData();
    });
    await Future.microtask(() {
      _pulseController.updateUserFilter('All users');
    });
    await Future.microtask(() {
      _pulseController.setSelectedUserName('All users');
    });

    await Future.microtask(() {
      _pulseController.updateCategoryFilter('0');
    });
    await Future.microtask(() {
      _pulseController.updateSelectedCategory(-1);
    });
    await Future.microtask(() {
      _pulseController.updateSelectedcategory();
    });
    await Future.microtask(() {
      _pulseController.clearFilters();
    });
  }
}
