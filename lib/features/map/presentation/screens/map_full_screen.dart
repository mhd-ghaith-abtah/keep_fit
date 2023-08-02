import 'package:flutter/material.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/features/gyms/presentation/screens/gyms_screen.dart';
import 'package:keep_fit/features/map/presentation/screens/widgets/map_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MapFullScreen extends StatefulWidget {
  const MapFullScreen({super.key, required this.data});

  final GYMDummyModel data;

  @override
  State<MapFullScreen> createState() => _MapFullScreenState();
}

class _MapFullScreenState extends State<MapFullScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
        ),
        body: MapWidget(
          zoomLocation: widget.data.locationRaw,
          fullScreen: true,
        ),
      );
}
