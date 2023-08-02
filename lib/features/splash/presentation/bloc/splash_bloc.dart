import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/app/app_management/route_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/app/storage/app_preferences.dart';
import 'package:keep_fit/core/utils/utils.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppPreferences _appPreferences;

  SplashBloc(this._appPreferences) : super(SplashInitial()) {
    on<InitApp>((event, emit) async {
      emit(InitializingApp());
      final isSignedIn = _appPreferences.getUserSignedIn();
      await Utils.precacheAssets(event.context);
      await Future.delayed(AppDurations.superSlow);
      if (isSignedIn) {
        RouteGenerator.router.go(Routes.gymsDashboardRoute);
      } else {
        /// Navigate to gyms
        RouteGenerator.router.pushReplacement("/${Routes.gymsRoute}");
      }
      emit(AppInitialized());
    });
  }
}
