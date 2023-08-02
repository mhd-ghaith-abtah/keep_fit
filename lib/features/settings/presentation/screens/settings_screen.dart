import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/core/utils/utils.dart';
import 'package:keep_fit/core/widgets/basic_list_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.settingsNav.tr()),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: AppPadding.p2.h),
          children: [
            BasicListTile(
              title: AppStrings.language.tr(),
              leading: const Icon(
                Icons.translate_rounded,
                color: ColorManager.darkPrimary,
              ),
              onPress: () async =>
                  await Utils.showChooseAppLanguageSheet(context),
            ),
            BasicListTile(
              title: AppStrings.changePassword.tr(),
              leading: const Icon(
                Icons.password_rounded,
                color: ColorManager.darkPrimary,
              ),
              onPress: () {},
            ),
            BasicListTile(
              title: AppStrings.technicalSupport.tr(),
              leading: const Icon(
                Icons.support_agent_rounded,
                color: ColorManager.darkPrimary,
              ),
              onPress: () {},
            ),
            BasicListTile(
              title: AppStrings.sendFeedback.tr(),
              leading: const Icon(
                Icons.live_help_rounded,
                color: ColorManager.darkPrimary,
              ),
              onPress: () {},
            ),
            BasicListTile(
              title: AppStrings.logout.tr(),
              leading: const Icon(
                Icons.logout_rounded,
                color: ColorManager.darkPrimary,
              ),
              onPress: () {},
            ),
          ],
        ),
      );
}
