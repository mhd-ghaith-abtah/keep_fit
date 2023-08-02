import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/route_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/features/auth/presentation/screens/widgets/password_text_field.dart';
import 'package:keep_fit/features/gyms/presentation/screens/gyms_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.data});

  final GYMDummyModel data;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: ColorManager.navyBlue,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              _loginAppBar(context),
            ],
            body: _loginScreenBody(),
          ),
        ),
      );

  Widget _loginScreenBody() => Padding(
        padding: EdgeInsets.only(
          top: AppPadding.p12.h,
          left: AppPadding.p5.w,
          right: AppPadding.p5.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ..._loginTitle(),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                style: getRegularTextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s14,
                ),
                decoration: InputDecoration(
                  label: Text(
                    AppStrings.username.tr(),
                    style: getRegularTextStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  hintStyle: getThinTextStyle(
                    color: Colors.white54,
                    fontSize: FontSize.s10,
                  ),
                  hintText: AppStrings.usernameHint.tr(),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: ColorManager.darkPrimary,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s4.h),
              const PasswordTextField(),
              SizedBox(height: AppSize.s4.h),
              ElevatedButton(
                onPressed: () {
                  while (context.canPop()) {
                    context.pop();
                  }
                  context.go(Routes.gymsDashboardRoute);
                },
                child: Text(
                  AppStrings.login.tr(),
                  style: getBoldTextStyle(
                    color: ColorManager.navyBlue,
                    fontSize: FontSize.s16,
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget _loginAppBar(BuildContext context) => SliverAppBar(
        expandedHeight: AppSize.s20.h,
        collapsedHeight: AppSize.s7.h,
        pinned: true,
        leading: IconButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => ColorManager.secondary,
            ),
          ),
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new,
            color: ColorManager.navyBlue,
          ),
          onPressed: () => context.pop(),
        ),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
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
              Text(
                widget.data.name,
                style: getBoldTextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s18,
                ),
              ),
            ],
          ),
          background: Image.asset(
            widget.data.image,
            fit: BoxFit.cover,
          ),
        ),
      );

  List<Widget> _loginTitle() => [
        Text(
          AppStrings.welcome.tr(),
          style: getBoldTextStyle(
            color: ColorManager.darkPrimary,
            fontSize: FontSize.s28,
          ),
        ),
        SizedBox(height: AppSize.s2.h),
        Text(
          AppStrings.welcomeDesc.tr(),
          style: getRegularTextStyle(
            color: ColorManager.secondary,
            fontSize: FontSize.s18,
          ),
        ),
        SizedBox(height: AppSize.s5.h),
      ];
}
