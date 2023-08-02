import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    highlightColor: ColorManager.white100,
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.darkPrimary.withOpacity(.2),
    splashFactory: InkRipple.splashFactory,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      color: ColorManager.secondary,
      elevation: AppSize.s0,
      shadowColor: ColorManager.navyBlue,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: ColorManager.navyBlue,
          width: 0.5,
        ),
        borderRadius: BorderRadius.zero,
      ),
      titleTextStyle: getBoldTextStyle(
        color: ColorManager.white,
        fontSize: FontSize.s18,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: ColorManager.primary),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorManager.white100,
      selectionColor: ColorManager.darkPrimary,
      selectionHandleColor: ColorManager.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      helperMaxLines: 1,
      helperStyle: getRegularTextStyle(
        color: ColorManager.navyBlue,
        fontSize: FontSize.s14,
      ),
      contentPadding: const EdgeInsets.all(AppPadding.p16),
      errorMaxLines: 2,
      hintStyle: getRegularTextStyle(
        color: ColorManager.white,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumTextStyle(
        color: ColorManager.black,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularTextStyle(color: ColorManager.error),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSize.s1, color: ColorManager.white),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSize.s1, color: ColorManager.white100),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: AppSize.s1, color: ColorManager.white),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    iconTheme: const IconThemeData(color: ColorManager.navyBlue),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith(
            (states) => ColorManager.navyBlue),
        overlayColor: MaterialStateProperty.resolveWith(
            (states) => ColorManager.darkPrimary.withOpacity(.2)),
      ),
    ),
    listTileTheme: ListTileThemeData(
      style: ListTileStyle.list,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s15),
        side: BorderSide(
          width: AppSize.s1,
          color: ColorManager.lightGrey,
        ),
      ),
      textColor: ColorManager.black,
      titleTextStyle: getMediumTextStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      tileColor: ColorManager.white,
      iconColor: ColorManager.black,
      enableFeedback: true,
    ),
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateProperty.resolveWith((states) => ColorManager.navyBlue),
    ),
    cardTheme: const CardTheme(
      color: ColorManager.secondary,
      elevation: 10,
      margin: EdgeInsets.all(AppPadding.p10),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: ColorManager.navyBlue),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s30),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => Size(
            AppSize.s90.w,
            AppSize.s6.h,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => ColorManager.darkPrimary,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
        ),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: ColorManager.secondary,
      indicatorColor: ColorManager.darkPrimary,
      labelTextStyle: MaterialStateProperty.resolveWith(
        (states) => getBoldTextStyle(color: ColorManager.navyBlue),
      ),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) => const IconThemeData(color: ColorManager.navyBlue),
      ),
    ),
  );
}
