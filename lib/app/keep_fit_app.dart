import 'package:keep_fit/app/keep_fit_material.dart';
import 'package:keep_fit/core/services/app_lifecycle_handler.dart';
import 'package:flutter/material.dart';

class KeepFitApp extends StatefulWidget {
  /// named constructor
  const KeepFitApp._internal();

  /// singleton or single instance
  static const KeepFitApp _instance = KeepFitApp._internal();

  /// factory
  factory KeepFitApp() => _instance;

  @override
  State<KeepFitApp> createState() => _KeepFitAppState();
}

class _KeepFitAppState extends State<KeepFitApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(AppLifecycleEventHandler());
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(AppLifecycleEventHandler());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeepFitMaterial();
}
