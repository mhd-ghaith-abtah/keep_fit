import 'package:keep_fit/core/utils/constants.dart';

class AppConfigurations {
  static const String applicationName = "Keep Fit";
  static const String playStorePackageName = "com.keep_fit.app";
  static const String appStoreBundleId = "com.keep_fit.app";
  static const String appStoreId = "";

  /// endpoints URLs
  static const String baseUrl = "";

  /// headers
  static const Map<String, String> baseHeaders = {
    Constants.accept: "*/*",
    Constants.authorization: Constants.empty,
    Constants.contentType: Constants.applicationJson,
  };
}
