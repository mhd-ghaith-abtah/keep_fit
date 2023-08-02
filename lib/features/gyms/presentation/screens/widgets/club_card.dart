import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/route_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/features/gyms/presentation/screens/gyms_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClubCard extends StatelessWidget {
  const ClubCard({
    super.key,
    required this.data,
    required this.showLogin,
  });

  final GYMDummyModel data;
  final bool showLogin;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.push(
          "/${Routes.gymsRoute}/${Routes.gymDetailsRoute}",
          extra: {"data": data, "showLogin": showLogin},
        ),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s30)),
                  child: Image.asset(data.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(data.logo),
                      radius: AppSize.s30,
                    ),
                    SizedBox(width: AppSize.s2.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldTextStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18,
                            ),
                          ),
                          SizedBox(width: AppSize.s0_5.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                color: ColorManager.darkPrimary,
                              ),
                              SizedBox(width: AppSize.s1.w),
                              Expanded(
                                child: Text(
                                  data.location,
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
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
