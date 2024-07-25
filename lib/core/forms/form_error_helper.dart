import 'package:collection/collection.dart';

class FormErrorHelper {
  final Map<String, dynamic>? errors;

  FormErrorHelper({this.errors});

  bool get hasErrors => this.errors != null;

  bool hasError(String key) =>
      hasErrors ? this.errors!.containsValue(key) : false;

  String? message(String key) {
    if (hasErrors) {
      dynamic? errorElement = this
          .errors!
          .entries
          .firstWhereOrNull((element) => element.value == key);
      return errorElement?.value;
    } else {
      return null;
    }
  }
}
