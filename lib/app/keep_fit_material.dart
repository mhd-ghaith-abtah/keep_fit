import 'package:keep_fit/app/app_configurations/app_configurations.dart';
import 'package:keep_fit/app/app_configurations/scroll_behavior.dart';
import 'package:keep_fit/app/app_management/language_manager/language_manager.dart';
import 'package:keep_fit/app/app_management/route_manager.dart';
import 'package:keep_fit/app/app_management/theme_manager.dart';
import 'package:keep_fit/app/dependency_injection/dependency_injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KeepFitMaterial extends StatefulWidget {
  /// named constructor
  const KeepFitMaterial._internal();

  /// singleton or single instance
  static const KeepFitMaterial _instance = KeepFitMaterial._internal();

  /// factory
  factory KeepFitMaterial() => _instance;

  @override
  State<KeepFitMaterial> createState() => _KeepFitMaterialState();
}

class _KeepFitMaterialState extends State<KeepFitMaterial> {
  @override
  void didChangeDependencies() {
    context.setLocale(instance<LanguageManager>().locale);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ResponsiveSizer(
        builder: (context, orientation, deviceType) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          scrollBehavior: StretchScrollBehavior(),
          title: AppConfigurations.applicationName,
          routerConfig: RouteGenerator.router,
          theme: getApplicationTheme(),
        ),
      );
}
