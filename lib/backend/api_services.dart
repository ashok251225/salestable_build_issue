import 'package:salestable/core/flutter_flow/flutter_flow_util.dart';

export 'api_manager.dart';

// API VARIABLES

const String scheme = "https";
const String host = "api.staging.salestable.ai";

String buildUrl(String path, {Map<String, dynamic>? queryParams}) {
  if (queryParams != null) {
    queryParams.removeWhere((key, value) => value == null || value == '');
  }
  path = path.replaceAll(RegExp('^/+'), '');
  var uri = Uri(
    scheme: '$scheme',
    host: '$host',
    path: '$path',
    queryParameters: queryParams,
  );
  return uri.toString();
}

dynamic successMessage({required dynamic jsonBody}) => getJsonField(
      jsonBody,
      r'''$.message''',
    );
