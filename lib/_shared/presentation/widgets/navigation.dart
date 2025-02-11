import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_find_taxi/core/config/theme/color_pallete.dart';
import 'package:go_find_taxi/core/constants/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBottomNavigation extends HookConsumerWidget {
  const AppBottomNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('AppBottomNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          selectedIndex: navigationShell.currentIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
          destinations: [
            ...navigationIcons.map((e) {
              final index = navigationIcons.indexOf(e);
              final isSelected = navigationShell.currentIndex == index;
              return NavigationDestination(
                label: e.label,
                icon: SvgPicture.asset(e.icon,
                    colorFilter: ColorFilter.mode(
                        isSelected ? ColorPalette.primary : Colors.black,
                        BlendMode.srcIn)),
              );
            }),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}

final List<({String label, String icon})> navigationIcons = [
  (label: 'Home', icon: Assets.assetsSvgsHome),
  (label: 'Bus', icon: Assets.assetsSvgsBusIcon),
  (label: 'Profile', icon: Assets.assetsSvgsProfile),
];
