import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/font_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/styles_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/core/utils/constants.dart';
import 'package:keep_fit/core/utils/extensions.dart';
import 'package:keep_fit/core/utils/utils.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetDirectionsSheetContent extends StatefulWidget {
  const GetDirectionsSheetContent({super.key, required this.destination});

  final Coords destination;

  @override
  State<GetDirectionsSheetContent> createState() =>
      _GetDirectionsSheetContentState();
}

class _GetDirectionsSheetContentState extends State<GetDirectionsSheetContent> {
  DirectionsMode selectedTravelMode = Constants.travelModes.first;

  @override
  Widget build(BuildContext context) => Container(
        width: AppSize.s100.w,
        height: AppSize.s25.h,
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
                  AppStrings.goingWay.tr(),
                  textAlign: TextAlign.right,
                  style: getBoldTextStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20,
                  vertical: AppPadding.p10,
                ),
                child: Center(
                  child: SizedBox(
                    width: AppSize.s100.w,
                    child: DropdownButton<DirectionsMode>(
                      alignment: Alignment.center,
                      items: Constants.travelModes
                          .map(
                            (item) => DropdownMenuItem<DirectionsMode>(
                              value: item,
                              alignment: Alignment.center,
                              child: Text(
                                item.getDirectionsModeLocalized(),
                                style: getBoldTextStyle(
                                  color: ColorManager.navyBlue,
                                  fontSize: FontSize.s16,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedTravelMode,
                      onChanged: (selected) => setState(() {
                        selectedTravelMode = selected!;
                      }),
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    if (availableMaps.isNotEmpty) {
                      for (var map in availableMaps) {
                        if (Platform.isAndroid &&
                            map.mapType == MapType.google) {
                          await map
                              .showDirections(
                                destination: widget.destination,
                                directionsMode: selectedTravelMode,
                              )
                              .then((value) => Navigator.pop(context));
                          break;
                        } else if (Platform.isIOS &&
                            map.mapType == MapType.apple) {
                          await map
                              .showDirections(
                                destination: widget.destination,
                                directionsMode: selectedTravelMode,
                              )
                              .then((value) => Navigator.pop(context));
                          break;
                        }
                      }
                    } else {
                      await Utils.showToast(AppStrings.noMapError.tr())
                          .then((value) => Navigator.pop(context));
                    }
                  },
                  child: Text(
                    AppStrings.showRoute.tr(),
                    style: getBoldTextStyle(
                      color: ColorManager.navyBlue,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
