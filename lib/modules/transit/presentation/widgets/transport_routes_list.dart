import 'package:flutter/material.dart';
import 'package:go_find_taxi/modules/transit/data/repositories/remote/i_route_remote.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/config/router/route_name.dart';
import '../../../../core/constants.dart';
import '../../data/models/transport_place_model.dart';
import '../providers/transportRoute/transport_route_notifier.dart';
import 'route_display_widget.dart';

class TransportRoutesList extends HookConsumerWidget {
  const TransportRoutesList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastRoutes = ref.watch(fetchLastRoutesProvider);

    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("TRANSPORT ROUTES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                TextButton(
                    onPressed: () => context.go('/bus'),
                    child: const Text("See All")),
              ],
            ),
          ),
          lastRoutes.maybeWhen(
              orElse: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              data: (transportRoutes) {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transportRoutes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    const currentLocationStr = currentLocationString;
                    final to = transportRoutes[index].name;
                    return RouteDisplayWidget(
                      onTap: () async {
                        final currentLocation =
                            await TransportPlace.fromCurrentLocation();
                        // fetch the transport plans between two places
                        final repo = ref.read(routeRepoRemoteProvider);
                        final result =
                            await repo.getTransportRouteFromTwoPoints(
                          from: currentLocation,
                          to: transportRoutes[index],
                          skipCache: true,
                        );
                        if (result.failure != null) {
                          return;
                        }
                        if (!context.mounted) {
                          return;
                        }
                        context.push(RouteName.transitOverview, extra: {
                          'plan': result.success!.data,
                          'from': currentLocation,
                          'to': transportRoutes[index]
                        });
                      },
                      from: currentLocationStr,
                      to: to ?? "-",
                    );
                  },
                );
              })
        ],
      ),
    );
  }

  // void fetchTransportRoutes(WidgetRef ref, BuildContext context) async {
  //   safeUiApiCall(context, () async {
  //     await ref
  //         .read(transportRouteNotifierProvider.notifier)
  //         .getTransportRoutes();
  //   });
  // }
}
