import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep_fit/app/app_management/route_manager.dart';
import 'package:keep_fit/app/app_management/strings_manager.dart';
import 'package:keep_fit/app/app_management/values_manager.dart';

class KeepFitNavigationBar extends StatefulWidget {
  const KeepFitNavigationBar({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<KeepFitNavigationBar> createState() => _KeepFitNavigationBarState();
}

class _KeepFitNavigationBarState extends State<KeepFitNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: _currentIndex == 0
            ? () async => true
            : () async {
                setState(() {
                  _currentIndex = 0;
                });
                context.go(Routes.gymsDashboardRoute);
                return false;
              },
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (newIdx) =>
              _onDestinationTapped(newIdx, context),
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: const Icon(Icons.home_outlined, size: AppSize.s30),
              selectedIcon: const Icon(Icons.home_rounded),
              label: AppStrings.homeNav.tr(),
            ),
            NavigationDestination(
              icon: const Icon(Icons.article_outlined),
              selectedIcon: const Icon(Icons.article_rounded),
              label: AppStrings.articlesNav.tr(),
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_outline_rounded),
              selectedIcon: const Icon(Icons.person),
              label: AppStrings.accountNav.tr(),
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings_rounded),
              label: AppStrings.settingsNav.tr(),
            ),
          ],
        ),
      );

  void _onDestinationTapped(int destinationIndex, BuildContext context) {
    if (destinationIndex == _currentIndex) return;
    setState(() {
      _currentIndex = destinationIndex;
    });
    switch (destinationIndex) {
      case 0:
        context.go(Routes.gymsDashboardRoute);
        break;
      case 1:
        context.go(Routes.articlesRoute);
        break;
      case 2:
        context.go(Routes.profileRoute);
        break;
      case 3:
        context.go(Routes.settingsRoute);
        break;
    }
  }
}
