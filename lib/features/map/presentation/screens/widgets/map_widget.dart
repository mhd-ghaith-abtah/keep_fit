import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:keep_fit/app/app_management/color_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/features/map/presentation/screens/widgets/map_zoom_directions_buttons.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.zoomLocation,
    this.fullScreen = false,
  });

  final LatLng zoomLocation;
  final bool fullScreen;

  @override
  Widget build(BuildContext context) => Container(
        height: fullScreen ? null : AppSize.s25.h,
        margin: fullScreen
            ? null
            : EdgeInsets.symmetric(
                horizontal: AppPadding.p16.sp, vertical: AppPadding.p12.sp),
        decoration: fullScreen
            ? null
            : BoxDecoration(
                border: Border.all(
                  width: AppSize.s1,
                  color: ColorManager.navyBlue,
                ),
              ),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: zoomLocation,
            initialZoom: AppSize.s18,
            maxZoom: AppSize.s18,
            minZoom: AppSize.s4,
          ),
          nonRotatedChildren: [
            MapZoomDirectionsButtons(
              minZoom: AppSize.s4,
              maxZoom: AppSize.s18,
              mini: fullScreen ? false : true,
              padding: fullScreen ? AppPadding.p16.sp : AppPadding.p5.sp,
              alignment: AlignmentDirectional.bottomEnd,
              fullScreen: fullScreen,
              destination:
                  Coords(zoomLocation.latitude, zoomLocation.longitude),
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.keep_fit.app',
            ),
            MarkerLayer(
              anchorPos: const AnchorPos.align(AnchorAlign.top),
              markers: [
                Marker(
                  point: zoomLocation,
                  builder: (ctx) => const Icon(Icons.location_pin, size: 60),
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          ],
        ),
      );
}
