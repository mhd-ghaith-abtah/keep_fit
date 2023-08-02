import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/language_manager/language_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/app/dependency_injection/dependency_injection.dart';
import 'package:keep_fit/core/utils/utils.dart';
import 'package:keep_fit/core/widgets/basic_radio_list_tile.dart';
import 'package:keep_fit/features/settings/presentation/bloc/manage_language_cubit/manage_language_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseAppLanguageSheetContent extends StatefulWidget {
  const ChooseAppLanguageSheetContent({super.key});

  @override
  State<ChooseAppLanguageSheetContent> createState() =>
      _ChooseAppLanguageSheetContentState();
}

class _ChooseAppLanguageSheetContentState
    extends State<ChooseAppLanguageSheetContent> {
  late final ManageLanguageCubit _manageLanguageCubit;

  _bind() => _manageLanguageCubit = instance<ManageLanguageCubit>()..init();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  _disposeCubit() async => await _manageLanguageCubit.close();

  @override
  void dispose() {
    _disposeCubit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => _manageLanguageCubit,
        child: BlocConsumer<ManageLanguageCubit, ManageLanguageState>(
          listener: (context, state) async {
            if (state is ManageLanguageLoaded &&
                state.loadedType == ManageLanguageStateTypes.changingLanguage) {
              await Utils.showToast(
                AppStrings.languageChanged.tr(),
                length: Toast.LENGTH_SHORT,
                toastGravity: ToastGravity.TOP,
              );
            }
          },
          builder: (context, state) => Container(
            width: AppSize.s100.w,
            height: AppSize.s30.h,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s30),
                  topRight: Radius.circular(AppSize.s30),
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 20,
                      top: 20,
                      bottom: 10,
                    ),
                    child: Text(
                      AppStrings.chooseLanguage.tr(),
                      textAlign: TextAlign.right,
                      style: getBoldTextStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s22,
                      ),
                    ),
                  ),
                  if (state is ManageLanguageLoading) ...[
                    Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: AppPadding.p5.h),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  ] else if (state is ManageLanguageLoaded) ...[
                    BasicRadioListTile<Language>(
                      onChanged: (Language? newLanguage) =>
                          _manageLanguageCubit.changeAppLanguage(
                              context, newLanguage ?? Language.en),
                      title: "English",
                      value: Language.en,
                      groupValue: _manageLanguageCubit.selectedLanguage,
                    ),
                    BasicRadioListTile(
                      onChanged: (Language? newLanguage) =>
                          _manageLanguageCubit.changeAppLanguage(
                              context, newLanguage ?? Language.ar),
                      title: "العربية",
                      value: Language.ar,
                      groupValue: _manageLanguageCubit.selectedLanguage,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
}
