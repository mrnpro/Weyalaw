// import 'package:go_find_taxi/core/handlers/result.dart';
// import 'package:google_maps_widget/google_maps_widget.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../../../../core/services/LocationService/location_service.dart';
// import '../../../data/models/route_model.dart';
// import '../../../data/repositories/remote/i_route_remote.dart';
// import 'state/transport_route_state.dart';
// part 'transport_route_notifier.g.dart';

// @riverpod
// class TransportRouteNotifier extends _$TransportRouteNotifier {
//   @override
//   TransportRouteState build() {
//     // this is your build . you can return any state you want
//     return const TransportRouteState.initial();
//   }

//   Future<void> getTransportRoutes() async {
//     state = const TransportRouteState.gettingCurrentLocation();
//     LatLng currentLocation;
//     try {
//       final locationService = LocationService.getInstance();
//       currentLocation = await locationService.getCurrentLocation();
//     } catch (e) {
//       state = TransportRouteState.failure(error: e.toString());
//       return;
//     }
//     state = const TransportRouteState.loading();
//     final result = await ref
//         .read(routeRepoRemoteProvider)
//         .getTransportRoutes(currentLocation: currentLocation);
//     result.fold(onSuccess: (data) {
//       state = TransportRouteState.success(data.data);
//     }, onFailure: (error) {
//       state = TransportRouteState.failure(error: error.message ?? "");
//     });
//   }
// }

import 'package:go_find_taxi/modules/transit/data/models/transport_place_model.dart';
import 'package:go_find_taxi/modules/transit/data/repositories/remote/i_route_remote.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/services/LocationService/location_service.dart';
import '../../../../../core/utils/src/location_util.dart';

part 'transport_route_notifier.g.dart';

@riverpod
Future<List<TransportPlace>> fetchLastRoutes(Ref ref) async {
  final lastUsedDestinationResult =
      await ref.read(routeRepoRemoteProvider).getLastedUsedDestination();
  if (lastUsedDestinationResult.failure != null) {
    return [];
  }

  final lastUsedDestination = lastUsedDestinationResult.success?.data;
  lastUsedDestination?.take(5);
  // filter out the the places that are the same as the current location
  /// filter: by cordinate radius .
  final currentLocation =
      await LocationService.getInstance().getCurrentLocation();
  lastUsedDestination?.removeWhere((destination) {
    final distance = LocationUtil.getRadiusBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      destination.coordinates!.latitude,
      destination.coordinates!.longitude,
    );
    return distance < 5;
  });
  return lastUsedDestination ?? [];
}
