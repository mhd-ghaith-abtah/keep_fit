import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:keep_fit/app/app_configurations/assets.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/core/utils/constants.dart';
import 'package:keep_fit/core/widgets/sheets/media_source_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/services.dart';
import 'package:keep_fit/features/map/presentation/screens/widgets/get_directions_sheet_content.dart';
import 'package:keep_fit/features/settings/presentation/screens/widgets/choose_app_language_sheet_content.dart';
import 'package:map_launcher/map_launcher.dart';

class Utils {
  static Future<void> showToast(String message,
          {ToastGravity? toastGravity, Toast? length}) async =>
      await Fluttertoast.showToast(
        msg: message,
        toastLength: length ?? Toast.LENGTH_LONG,
        backgroundColor: ColorManager.primary,
        textColor: ColorManager.black,
        gravity: toastGravity ?? ToastGravity.SNACKBAR,
      );

  static void showCustomToast(String message) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
      );

  static Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  static bool isEmailValid(String email) =>
      Constants.emailRegex.hasMatch(email);

  static bool isPhoneNumberValid(String phoneNumber) =>
      Constants.phoneNumberRegex.hasMatch(phoneNumber);

  static bool isPasswordValidLogin(String password) => password.length >= 8;

  static bool isPasswordValidRegister(String password) =>
      Constants.passwordRegex.hasMatch(password);

  static Future precacheAssets(BuildContext context) async =>
      await precacheImage(const AssetImage(Assets.gym1), context)
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gym2), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gym3), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gym4), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gym5), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gym6), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gymLogo1), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gymLogo2), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gymLogo3), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gymLogo4), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gymLogo5), context))
          .then((value) async =>
              await precacheImage(const AssetImage(Assets.gymLogo6), context));

  static String parsePhoneNumberForServer(
    String phoneNumber,
    String countryCode,
  ) {
    String newPhoneNumber = "${countryCode.substring(1)}-";
    if (phoneNumber.startsWith("0")) {
      phoneNumber = phoneNumber.substring(0);
    }
    newPhoneNumber += phoneNumber;
    return newPhoneNumber;
  }

  static String parsePhoneNumberForMobile(
    String phoneNumber,
  ) {
    final splat = phoneNumber.split("-");
    return "+${splat.first} ${splat.last}";
  }

  static String getDateFromString(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate =
        intl.DateFormat('yyyy-MM-dd, HH:mm').format(dateTime);
    return formattedDate;
  }

  static String getTimeFromUTCString(String date) {
    final formattedDate = DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      int.parse(date.split(":").first),
      int.parse(date.split(":").last),
    ).toLocal();
    String localTime = Constants.empty;
    if (formattedDate.hour < 10) {
      localTime = "0${formattedDate.hour}:";
    } else {
      localTime = "${formattedDate.hour}:";
    }
    if (formattedDate.minute < 10) {
      localTime = "${localTime}0${formattedDate.minute}";
    } else {
      localTime = "$localTime${formattedDate.minute}";
    }
    return localTime;
  }

  /// sheets
  static Future<void> showChooseAppLanguageSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        useRootNavigator: true,
        builder: (context) => const ChooseAppLanguageSheetContent(),
      );

  static Future<void> showGetDirectionsSheet(
          BuildContext context, Coords destination) =>
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        useRootNavigator: true,
        builder: (context) =>
            GetDirectionsSheetContent(destination: destination),
      );

  static Future<void> showMediaSourceBottomSheet({
    required BuildContext context,
    required Function() onPressCamera,
    required Function() onPressGallery,
  }) async =>
      Platform.isAndroid
          ? await showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              useRootNavigator: true,
              builder: (context) => MediaSourceBottomSheet(
                onPressCamera: onPressCamera,
                onPressGallery: onPressGallery,
              ),
            )
          : await showCupertinoModalPopup(
              context: context,
              useRootNavigator: true,
              builder: (context) => MediaSourceBottomSheet(
                onPressCamera: onPressCamera,
                onPressGallery: onPressGallery,
              ),
            );
}
