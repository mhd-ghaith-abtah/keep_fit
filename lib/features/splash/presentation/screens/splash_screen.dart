import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/app/app_configurations/assets.dart';
import 'package:keep_fit/app/dependency_injection/dependency_injection.dart';
import 'package:keep_fit/features/splash/presentation/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc _splashBloc;

  _bind() => _splashBloc = instance<SplashBloc>()..add(InitApp(context));

  @override
  void initState() {
    super.initState();
    _bind();
  }

  _disposeBloc() async => await _splashBloc.close();

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => _splashBloc,
        child: Scaffold(body: Center(child: Image.asset(Assets.logo))),
      );
}
