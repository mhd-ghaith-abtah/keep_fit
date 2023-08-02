import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_fit/app/app_configurations/assets.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/language_manager/language_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/app/dependency_injection/dependency_injection.dart';
import 'package:keep_fit/core/utils/utils.dart';
import 'package:keep_fit/core/widgets/basic_list_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ImagePicker _picker;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.accountNav.tr()),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: AppPadding.p2.h),
          children: [
            Center(
              child: Stack(
                fit: StackFit.loose,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(Assets.person),
                    radius: AppSize.s55,
                  ),
                  Positioned.directional(
                    textDirection: instance<LanguageManager>().isArabic
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: ColorManager.darkPrimary,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ColorManager.navyBlue,
                        ),
                      ),
                      onPressed: () async =>
                          await Utils.showMediaSourceBottomSheet(
                        context: context,
                        onPressCamera: () async {
                          context.pop();
                          await _picker
                              .pickImage(source: ImageSource.camera)
                              .then(
                                (res) => res != null ? null : null,
                              );
                        },
                        onPressGallery: () async {
                          context.pop();
                          await _picker
                              .pickImage(source: ImageSource.gallery)
                              .then(
                                (res) => res != null ? null : null,
                              );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 62.5.h,
              margin: EdgeInsets.only(top: AppPadding.p2.h),
              decoration: const ShapeDecoration(
                color: ColorManager.navyBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
              child: Column(
                children: [
                  BasicListTile(
                    title: "Mohammad Ghaith Al-Abtah",
                    titleTextStyle: getRegularTextStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s14,
                    ),
                    leading: const Icon(
                      Icons.person_outline_rounded,
                      color: ColorManager.darkPrimary,
                    ),
                    onPress: null,
                  ),
                  BasicListTile(
                    title: "Male",
                    titleTextStyle: getRegularTextStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s14,
                    ),
                    leading: const Icon(
                      Icons.male_rounded,
                      color: ColorManager.darkPrimary,
                    ),
                    onPress: null,
                  ),
                  BasicListTile(
                    title: "+963 930 891 38",
                    titleTextStyle: getRegularTextStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s14,
                    ),
                    leading: const Icon(
                      Icons.phone,
                      color: ColorManager.darkPrimary,
                    ),
                    onPress: null,
                  ),
                  const Divider(
                    color: ColorManager.secondary,
                    endIndent: 10,
                    indent: 10,
                    thickness: 2,
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Text(
                    "My subscriptions",
                    textAlign: TextAlign.center,
                    style: getBoldTextStyle(
                      color: ColorManager.darkPrimary,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd ,
                      child: Text(
                        "25-10-2021",
                        style: getRegularTextStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s10,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.all(AppPadding.p10),
                    padding: const EdgeInsets.all(AppPadding.p10),
                    decoration: const ShapeDecoration(
                      color: ColorManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Month subscription",
                          style: getRegularTextStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14,
                          ),
                        ),
                        Text(
                          "85000 SP",
                          style: getRegularTextStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
