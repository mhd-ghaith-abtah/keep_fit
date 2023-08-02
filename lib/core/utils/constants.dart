import 'package:keep_fit/app/app_configurations/assets.dart';
import 'package:map_launcher/map_launcher.dart';

class Constants {
  static const empty = "";
  static const zero = 0;
  static const applicationJson = "application/json";
  static const multipart = "multipart/form-data";
  static const contentType = "content-type";
  static const accept = "accept";
  static const role = "role";
  static const file = "file";
  static const email = "email";
  static const authorization = "Authorization";
  static const language = "lang";
  static const timeout = 60 * 1000;
  static const logTag = "keep_fit";
  static const logFileName = "dr_purple_log_file";
  static const logDirectory = "dr_purple_logs";
  static const logExportedDirectory = "dr_purple_logs/Exported";

  // static RegExp passwordRegex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d).{8,}$');
  static RegExp passwordRegex = RegExp(r'^(?=.*?[aA-zZ])(?=.*?\d).{8,}$');
  static RegExp emailRegex =
      RegExp(r"^[a-zA-Z\d.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+");
  static RegExp phoneNumberRegex = RegExp(r'(^(?:[+0]9)?\d{8,14}$)');

  static const List<DirectionsMode> travelModes = [
    DirectionsMode.driving,
    DirectionsMode.walking,
    DirectionsMode.bicycling,
  ];

  static const List<String> clubImages = [
    Assets.gym1,
    Assets.gym2,
    Assets.gym3,
    Assets.gym4,
    Assets.gym5,
    Assets.gym6,
  ];
}
