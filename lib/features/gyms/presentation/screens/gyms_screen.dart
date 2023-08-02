import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_configurations/assets.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/core/utils/utils.dart';
import 'package:keep_fit/features/gyms/presentation/screens/widgets/club_card.dart';
import 'package:latlong2/latlong.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GymsScreen extends StatefulWidget {
  const GymsScreen({super.key, required this.isWithBottomNav});

  final bool isWithBottomNav;

  @override
  State<GymsScreen> createState() => _GymsScreenState();
}

class _GymsScreenState extends State<GymsScreen> {
  final List<GYMDummyModel> _gyms = [
    GYMDummyModel(
      Assets.gym1,
      Assets.gymLogo1,
      "شعلان - جانب كافيه بيت فيروز",
      "Onada Gym",
      const LatLng(33.517623, 36.288852),
    ),
    GYMDummyModel(
      Assets.gym2,
      Assets.gymLogo2,
      "ميسات - شارع برنية",
      "AK Gym",
      const LatLng(33.532161, 36.296658),
    ),
    GYMDummyModel(
      Assets.gym3,
      Assets.gymLogo3,
      "شارع مرشد خاطر - تقاطع شارع بغداد",
      "Rock Gym",
      const LatLng(33.521285, 36.300531),
    ),
    GYMDummyModel(
      Assets.gym4,
      Assets.gymLogo4,
      "باب مصلى - مدخل ملعب المجد",
      "Al-Majd Gym",
      const LatLng(33.497897, 36.302349),
    ),
    GYMDummyModel(
      Assets.gym5,
      Assets.gymLogo5,
      "غساني - خلف بنك الشرق",
      "I Gym",
      const LatLng(33.522238, 36.314198),
    ),
    GYMDummyModel(
      Assets.gym6,
      Assets.gymLogo6,
      "ميدان",
      "Xpower Gym",
      const LatLng(33.489858, 36.296088),
    ),
  ];

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: _gymsAppBar(),
          body: _gymsBody(),
        ),
      );

  Widget _gymsBody() => ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.only(top: AppPadding.p10),
        itemCount: _gyms.length,
        itemBuilder: (context, index) => ClubCard(
          data: _gyms[index],
          showLogin: !widget.isWithBottomNav,
        ),
      );

  AppBar _gymsAppBar() => AppBar(
        title: Text(AppStrings.gyms.tr()),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppSize.s8.h),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: TextFormField(
              style: getRegularTextStyle(
                color: ColorManager.white,
                fontSize: FontSize.s14,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: AppStrings.searchHint.tr(),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: ColorManager.darkPrimary,
                ),
              ),
            ),
          ),
        ),
        actions: !widget.isWithBottomNav
            ? [
                IconButton(
                  icon: const Icon(Icons.translate_rounded),
                  onPressed: () async =>
                      await Utils.showChooseAppLanguageSheet(context),
                ),
                IconButton(
                  icon: const Icon(Icons.live_help_rounded),
                  onPressed: () {},
                ),
              ]
            : null,
      );
}

class GYMDummyModel {
  final String image;
  final String logo;
  final String location;
  final String name;
  final LatLng locationRaw;

  GYMDummyModel(
      this.image, this.logo, this.location, this.name, this.locationRaw);
}
