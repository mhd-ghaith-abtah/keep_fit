import 'package:keep_fit/app/app_management/language_manager/language_manager.dart';
import 'package:keep_fit/app/dependency_injection/dependency_injection.dart';
import 'package:keep_fit/app/keep_fit_app.dart';
import 'package:keep_fit/core/services/background_uploader/background_uploader.dart';
import 'package:keep_fit/core/services/log_service.dart';
import 'package:keep_fit/core/services/notification_service/notification_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  /// flutter
  WidgetsFlutterBinding.ensureInitialized();

  /// localization
  await EasyLocalization.ensureInitialized();

  /// dependency injection
  await initAppModule();

  /// notification channels
  await instance<NotificationService>().initNotifications();
  await instance<NotificationService>().dismissAllNotifications();

  /// background uploader
  await BackgroundUploader.setFlutterUploaderBackgroundHandler();
  BackgroundUploader.initializeListeners();

  /// app language
  instance<LanguageManager>().initiateLocale();

  /// init log errors to file
  await LogService().initializeLoggingService();

  runApp(
    EasyLocalization(
      supportedLocales: SupportedLanguages.all,
      path: translationAssetsPath,
      child: KeepFitApp(),
    ),
  );
}
