import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/route_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/core/utils/enums.dart';
import 'package:keep_fit/core/widgets/images_slider.dart';
import 'package:keep_fit/core/widgets/social_button.dart';
import 'package:keep_fit/features/map/presentation/screens/widgets/map_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'gyms_screen.dart';

class GymDetailsScreen extends StatefulWidget {
  const GymDetailsScreen({
    super.key,
    required this.data,
    required this.showLogin,
  });

  final GYMDummyModel data;
  final bool showLogin;

  @override
  State<GymDetailsScreen> createState() => _GymDetailsScreenState();
}

class _GymDetailsScreenState extends State<GymDetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _gymDetailsAppBar(),
        body: _gymDetailsBody(context),
      );

  Widget _gymDetailsBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _findUsSection(),
            const ImagesSlider(),
            ..._mapSection(context),
            _bottomButtonsSection(),
          ],
        ),
      );

  Widget _bottomButtonsSection() => Padding(
        padding: EdgeInsets.all(AppPadding.p16.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.resolveWith(
                  (states) => Size(
                    AppSize.s45.w,
                    AppSize.s5.h,
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => ColorManager.white,
                ),
              ),
              onPressed: () {},
              child: Text(
                AppStrings.workingHours.tr(),
                style: getBoldTextStyle(
                  color: ColorManager.darkPrimary,
                  fontSize: FontSize.s16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.resolveWith(
                  (states) => Size(
                    AppSize.s45.w,
                    AppSize.s5.h,
                  ),
                ),
              ),
              child: Text(
                AppStrings.clubSubscriptions.tr(),
                style: getBoldTextStyle(
                  color: ColorManager.navyBlue,
                  fontSize: FontSize.s16,
                ),
              ),
            ),
          ],
        ),
      );

  List<Widget> _mapSection(BuildContext context) => [
        Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p16.sp,
            left: AppPadding.p16.sp,
            right: AppPadding.p16.sp,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.gymLocation.tr(),
                style: getMediumTextStyle(
                  color: ColorManager.navyBlue,
                  fontSize: FontSize.s14,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: AppStrings.openMap.tr(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.push(
                          "/${Routes.mapFullScreenRoute}",
                          extra: widget.data,
                        ),
                  style: getMediumTextStyle(
                    color: ColorManager.darkPrimary,
                    fontSize: FontSize.s14,
                  ).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: ColorManager.darkPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        MapWidget(zoomLocation: widget.data.locationRaw, fullScreen: false),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on_rounded,
                color: ColorManager.darkPrimary,
              ),
              SizedBox(width: AppSize.s1.w),
              Expanded(
                child: Text(
                  widget.data.location,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: getThinTextStyle(
                    color: ColorManager.navyBlue,
                    fontSize: FontSize.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ];

  Widget _findUsSection() => Padding(
        padding: EdgeInsets.only(
          top: AppPadding.p16.sp,
          left: AppPadding.p16.sp,
          right: AppPadding.p16.sp,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              AppStrings.findUs.tr(),
              style: getBoldTextStyle(
                color: ColorManager.navyBlue,
                fontSize: FontSize.s16,
              ),
            ),
            const Spacer(),
            SocialButton(
              Buttons.phone,
              mini: true,
              onPressed: () {},
            ),
            SocialButton(
              Buttons.mobile,
              mini: true,
              onPressed: () {},
            ),
            SocialButton(
              Buttons.whatsApp,
              mini: true,
              onPressed: () {},
            ),
            SocialButton(
              Buttons.instagram,
              mini: true,
              onPressed: () {},
            ),
            SocialButton(
              Buttons.facebook,
              mini: true,
              onPressed: () {},
            ),
          ],
        ),
      );

  AppBar _gymDetailsAppBar() => AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.data.logo),
              radius: AppSize.s20,
            ),
            SizedBox(width: AppSize.s2.w),
            Text(widget.data.name),
          ],
        ),
        actions: widget.showLogin
            ? [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: RichText(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: AppStrings.login.tr(),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push(
                              "/${Routes.gymsRoute}/${Routes.gymDetailsRoute}/${Routes.loginRoute}",
                              extra: widget.data,
                            ),
                      style: getBoldTextStyle(
                        color: ColorManager.navyBlue,
                        fontSize: FontSize.s14,
                      ).copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: ColorManager.navyBlue,
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      );
}
