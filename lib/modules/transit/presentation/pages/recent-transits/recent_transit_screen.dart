import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_find_taxi/_shared/presentation/widgets/app_container.dart';
import 'package:go_find_taxi/modules/transit/presentation/providers/get-recent-transits/recent_transits_provider.dart';
import 'package:go_find_taxi/modules/transit/presentation/widgets/route_display_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/router/route_name.dart';
import '../../../data/repositories/remote/i_route_remote.dart';

class RecentTransitScreen extends StatefulHookConsumerWidget {
  const RecentTransitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentTransitScreenState();
}

class _RecentTransitScreenState extends ConsumerState<RecentTransitScreen> {
  @override
  Widget build(BuildContext context) {
    final recentTransits = ref.watch(getRecentTransitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Transits'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return await ref.refresh(getRecentTransitsProvider.future);
        },
        child: recentTransits.maybeWhen(
          data: (transits) {
            if (transits.isEmpty) {
              return const Center(
                  child: AppContainer(
                isShadow: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.history, size: 48),
                    Gap(10),
                    Text(
                      'No Recent Transits',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    Gap(5),
                    Text(
                      'Your recent transit routes will appear here',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: transits.length,
              itemBuilder: (context, index) {
                final transit = transits[index];
                return RouteDisplayWidget(
                  from: transit.$1.name ?? "-",
                  to: transit.$2.name ?? "-",
                  onTap: () async {
                    // fetch the transport plans between two places
                    final repo = ref.read(routeRepoRemoteProvider);
                    final result = await repo.getTransportRouteFromTwoPoints(
                        from: transit.$1, to: transit.$2, skipCache: true);
                    if (result.failure != null) {
                      return;
                    }
                    if (!context.mounted) {
                      return;
                    }
                    context.push(RouteName.transitOverview, extra: {
                      'options': result.success!.data,
                      'from': transit.$1,
                      'to': transit.$2
                    });
                  },
                );
              },
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
