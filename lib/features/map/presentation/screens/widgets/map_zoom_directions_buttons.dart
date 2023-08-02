import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';
import 'package:keep_fit/core/utils/utils.dart';
import 'package:map_launcher/map_launcher.dart';

class MapZoomDirectionsButtons extends StatelessWidget {
  final double minZoom;
  final double maxZoom;
  final bool mini;
  final double padding;
  final AlignmentDirectional alignment;
  final Color? zoomInColor;
  final Color? zoomInColorIcon;
  final Color? zoomOutColor;
  final Color? zoomOutColorIcon;
  final IconData zoomInIcon;
  final IconData zoomOutIcon;
  final bool fullScreen;
  final Coords destination;
  static const _fitBoundsPadding = EdgeInsets.all(AppPadding.p12);

  const MapZoomDirectionsButtons({
    super.key,
    this.minZoom = AppSize.s4,
    this.maxZoom = AppSize.s18,
    this.mini = true,
    this.padding = AppSize.s2,
    required this.alignment,
    this.zoomInColor,
    this.zoomInColorIcon,
    this.zoomInIcon = Icons.zoom_in,
    this.zoomOutColor,
    this.zoomOutColorIcon,
    this.fullScreen = false,
    this.zoomOutIcon = Icons.zoom_out,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final map = MapCamera.of(context);
    return Align(
      alignment: alignment,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: padding, top: padding, right: padding),
            child: FloatingActionButton(
              heroTag: 'zoomInButton',
              mini: mini,
              backgroundColor: zoomInColor ?? Theme.of(context).primaryColor,
              onPressed: () {
                final paddedMapCamera = CameraFit.bounds(
                  bounds: map.visibleBounds,
                  padding: _fitBoundsPadding,
                ).fit(map);
                var zoom = paddedMapCamera.zoom + 1;
                if (zoom > maxZoom) {
                  zoom = maxZoom;
                }
                MapController.of(context).move(paddedMapCamera.center, zoom);
              },
              child: Icon(zoomInIcon,
                  color: zoomInColorIcon ?? IconTheme.of(context).color),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: padding, top: padding, right: padding),
            child: FloatingActionButton(
              heroTag: 'zoomOutButton',
              mini: mini,
              backgroundColor: zoomOutColor ?? Theme.of(context).primaryColor,
              onPressed: () {
                final paddedMapCamera = CameraFit.bounds(
                  bounds: map.visibleBounds,
                  padding: _fitBoundsPadding,
                ).fit(map);
                var zoom = paddedMapCamera.zoom - 1;
                if (zoom < minZoom) {
                  zoom = minZoom;
                }
                MapController.of(context).move(paddedMapCamera.center, zoom);
              },
              child: Icon(zoomOutIcon,
                  color: zoomOutColorIcon ?? IconTheme.of(context).color),
            ),
          ),
          if (fullScreen)
            Padding(
              padding: EdgeInsets.all(padding),
              child: FloatingActionButton(
                heroTag: 'getDirections',
                mini: mini,
                backgroundColor: zoomOutColor ?? Theme.of(context).primaryColor,
                onPressed: () async =>
                    await Utils.showGetDirectionsSheet(context, destination),
                child: Icon(Icons.directions,
                    color: zoomOutColorIcon ?? IconTheme.of(context).color),
              ),
            ),
        ],
      ),
    );
  }
}
