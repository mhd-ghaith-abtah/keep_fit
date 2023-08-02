import 'dart:io';

import 'package:keep_fit/app/app_configurations/assets.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MediaSourceBottomSheet extends StatelessWidget {
  const MediaSourceBottomSheet({
    Key? key,
    required this.onPressCamera,
    required this.onPressGallery,
  }) : super(key: key);

  final Function() onPressCamera;
  final Function() onPressGallery;

  @override
  Widget build(BuildContext context) => Platform.isAndroid
      ? _androidMediaSourceBottomSheet(context)
      : _iOSMediaSourceActionSheet(context);

  Widget _iOSMediaSourceActionSheet(BuildContext context) =>
      CupertinoActionSheet(
        message: Text(AppStrings.chooseImageSourceTitle.tr()),
        actions: [
          CupertinoActionSheetAction(
            onPressed: onPressCamera,
            child: Text(
              AppStrings.camera.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorManager.black,
                    fontSize: FontSize.s20,
                  ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: onPressGallery,
            child: Text(
              AppStrings.gallery.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorManager.black,
                    fontSize: FontSize.s20,
                  ),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text(
            AppStrings.cancelAction.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorManager.error,
                  fontSize: FontSize.s20,
                ),
          ),
        ),
      );

  Widget _androidMediaSourceBottomSheet(BuildContext context) => Container(
        width: AppSize.s100.w,
        height: AppSize.s18.h,
        padding: const EdgeInsetsDirectional.only(top: 10),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                AppStrings.chooseImageSourceTitle.tr(),
                style: getBoldTextStyle(
                  color: ColorManager.darkPrimary,
                  fontSize: FontSize.s16,
                ),
              ),
              SizedBox(height: AppSize.s2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AndroidBottomSheetButton(
                    icon: Assets.camera,
                    title: AppStrings.camera.tr(),
                    onPressed: onPressCamera,
                  ),
                  SizedBox(width: AppSize.s20.w),
                  AndroidBottomSheetButton(
                    icon: Assets.gallery,
                    title: AppStrings.gallery.tr(),
                    onPressed: onPressGallery,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class AndroidBottomSheetButton extends StatelessWidget {
  const AndroidBottomSheetButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final String icon;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(icon,
              width: AppSize.s50, color: ColorManager.secondary),
          SizedBox(height: AppSize.s1.h),
          Text(title,
              style: getMediumTextStyle(
                  color: ColorManager.navyBlue, fontSize: FontSize.s14)),
        ],
      ),
    );
  }
}
