import 'package:easy_localization/easy_localization.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/core/features/data/remote_data_source/models/params/params_model.dart';
import 'package:keep_fit/core/features/data/remote_data_source/remote_data_source.dart';
import 'package:keep_fit/core/utils/constants.dart';
import 'package:keep_fit/core/utils/enums.dart';
import 'package:map_launcher/map_launcher.dart';

extension NonNullString on String? {
  String messageOrEmpty({String? message}) => this ?? message ?? "";
}

extension NonNullInteger on int? {
  int numberOrZero({int? number}) => this ?? number ?? 0;
}

extension TrueOrFalse on int? {
  bool boolValue() => this == null || this == 0 ? false : true;
}

extension HTTPRequestType on RequestType {
  Future<Map<String, dynamic>> getHTTPRequestType(
    RemoteDataSource remoteDataSource,
    ParamsModel model,
  ) async {
    switch (this) {
      case RequestType.post:
        return await remoteDataSource.post(model);
      case RequestType.get:
        return await remoteDataSource.get(model);
      case RequestType.uploadFile:
        return await remoteDataSource.uploadFile(model);
      case RequestType.delete:
      case RequestType.put:
        return {};
    }
  }
}

extension DirectionsModeLocalized on DirectionsMode {
  String getDirectionsModeLocalized() {
    switch (this) {
      case DirectionsMode.driving:
        return AppStrings.driving.tr();
      case DirectionsMode.walking:
        return AppStrings.walk.tr();
      case DirectionsMode.bicycling:
        return AppStrings.bicycle.tr();
      default:
        return Constants.empty;
    }
  }
}
