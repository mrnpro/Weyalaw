import 'package:flutter/material.dart';
import 'package:weyalaw/modules/transit/presentation/pages/searchPage/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../_shared/presentation/widgets/navigation.dart';
import '../../../modules/home/presentation/home_page_page.dart';
import '../../../modules/transit/data/models/transport_place_model.dart';
import '../../../modules/transit/entities/transport_option_entity.dart';
import '../../../modules/transit/presentation/pages/recent-transits/recent_transit_screen.dart';
import '../../../modules/transit/presentation/pages/transitOverview/transit_overview_page.dart';
import '../../analytics/observers/observers.dart';
import '../../../_shared/presentation/screens/error_screen.dart';
import '../../barrels/all_screens_barrel.dart';
import 'route_name.dart';
import '../../../modules/transit/presentation/pages/share_location_wrapper.dart';

part 'redirection.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellMap');
final shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellBus');
final _shellNavigatorDKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: RouteName.transitOverview,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final options = data['options'] as List<TransportOptionEntity>;
          final from = data['from'] as TransportPlace;
          final to = data['to'] as TransportPlace;

          return TransitOverviewPage(options: options, from: from, to: to);
        },
      ),
      GoRoute(
        path: RouteName.search,
        builder: (context, state) => const SearchPage(),
      ),
      // GoRoute(
      //   path: RouteName.startNavigation,
      //   builder: (context, state) {
      //     final data = state.extra as Map<String, dynamic>;
      //     final plan = data['plan'] as Plan;
      //     final index = data['index'] as int;
      //     return StartNavigationScreen(plan: plan, index: index);
      //   },
      // ),
      GoRoute(
        path: RouteName.seeAllTransportRoute,
        builder: (context, state) => const SeeAllTransportRoute(),
      ),
      GoRoute(
        name: 'share-location',
        path: '/share-location',
        builder: (context, state) {
          final lat =
              double.tryParse(state.uri.queryParameters['lat'] ?? '') ?? 0.0;
          final lng =
              double.tryParse(state.uri.queryParameters['lng'] ?? '') ?? 0.0;

          return ShareLocationWrapper(
            latitude: lat,
            longitude: lng,
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppBottomNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const Scaffold(
                  body: Center(
                    child: HomePage(),
                  ),
                ),
                routes: const [],
              ),
            ],
          ),
          // StatefulShellBranch(
          //   navigatorKey: _shellNavigatorBKey,
          //   routes: [
          //     GoRoute(
          //       path: '/map',
          //       builder: (context, state) => const Scaffold(
          //         body: Center(
          //           child: Text('Section B'),
          //         ),
          //       ),
          //       routes: const [],
          //     ),
          //   ],
          // ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCKey,
            routes: [
              GoRoute(
                path: '/bus',
                builder: (context, state) => const RecentTransitScreen(),
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Profile')),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: goRouterRedirect,
    observers: [NavigatorObserverAnalytics()],
    errorBuilder: (context, state) => ErrorScreen(state.error),
  );
});
