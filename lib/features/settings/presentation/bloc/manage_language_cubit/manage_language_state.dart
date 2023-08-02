part of 'manage_language_cubit.dart';

@immutable
abstract class ManageLanguageState {}

class ManageLanguageInitial extends ManageLanguageState {}

class ManageLanguageLoading extends ManageLanguageState {
  final ManageLanguageStateTypes loadingType;

  ManageLanguageLoading({required this.loadingType});
}

class ManageLanguageLoaded extends ManageLanguageState {
  final ManageLanguageStateTypes loadedType;

  ManageLanguageLoaded({required this.loadedType});
}

enum ManageLanguageStateTypes { init, changingLanguage }
