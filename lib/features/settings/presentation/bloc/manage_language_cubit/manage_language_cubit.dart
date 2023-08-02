import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/app/app_management/language_manager/language_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';

part 'manage_language_state.dart';

class ManageLanguageCubit extends Cubit<ManageLanguageState> {
  final LanguageManager _languageManager;

  ManageLanguageCubit(this._languageManager) : super(ManageLanguageInitial());
  late Language selectedLanguage;

  void init() async {
    emit(ManageLanguageLoading(loadingType: ManageLanguageStateTypes.init));
    selectedLanguage = _languageManager.appCurrentLanguage;
    emit(ManageLanguageLoaded(loadedType: ManageLanguageStateTypes.init));
  }

  Future<void> changeAppLanguage(
      BuildContext context, Language newLanguage) async {
    emit(ManageLanguageLoading(
        loadingType: ManageLanguageStateTypes.changingLanguage));
    selectedLanguage = newLanguage;
    await Future.delayed(AppDurations.superFast);
    await _languageManager
        .setLocal(selectedLanguage)
        .then((newLocale) async => await context.setLocale(newLocale));
    await Future.delayed(AppDurations.megaFast);
    emit(ManageLanguageLoaded(
        loadedType: ManageLanguageStateTypes.changingLanguage));
  }
}
