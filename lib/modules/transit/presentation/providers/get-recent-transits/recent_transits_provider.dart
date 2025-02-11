import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/transport_place_model.dart';
import '../../../data/repositories/remote/i_route_remote.dart';
part 'recent_transits_provider.g.dart';

@riverpod
Future<List<(TransportPlace origin, TransportPlace destination)>>
    getRecentTransits(Ref ref) async {
  final lastUsedOriginResult =
      await ref.read(routeRepoRemoteProvider).getLastUsedOrigins();
  final lastUsedDestinationResult =
      await ref.read(routeRepoRemoteProvider).getLastedUsedDestination();

  if (lastUsedOriginResult.failure != null) {
    return [];
  }
  final lastUsedOrigin = lastUsedOriginResult.success?.data;
  if (lastUsedDestinationResult.failure != null) {
    return [];
  }
  final lastUsedDestination = lastUsedDestinationResult.success?.data;
  if (lastUsedOrigin == null || lastUsedDestination == null) {
    return [];
  }
  final res = List.generate(
    lastUsedOrigin.length,
    (index) => (lastUsedOrigin[index], lastUsedDestination[index]),
  );

  res.take(5);
  return res;
}
