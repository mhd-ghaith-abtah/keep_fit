part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class InitializingApp extends SplashState {}

class ErrorInitializingApp extends SplashState {}

class AppInitialized extends SplashState {}
