// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
/// This file defines the interface for the remote repository of the `route` module.
///
/// The `IRouteRepoRemote` interface is intended to provide a contract for
/// remote data operations related to the `route` module. Implementations
/// of this interface should handle all remote data interactions, such as API calls, network
/// requests, or any other form of remote data fetching.
///
/// Usage:
///
/// ```dart
/// class RouteRepoRemoteImpl implements IRouteRepoRemote {
///   // Implement the methods defined in the interface
/// }
///
/// final remoteRepository = RouteRepoRemoteImpl();
/// // Use remoteRepository to perform remote data operations
/// ```
///
/// This approach ensures that the remote data operations are abstracted and can be easily
/// swapped or mocked for testing purposes.
library;

import 'package:weyalaw/core/handlers/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/services/LocationService/location_service.dart';
import '../../../entities/transport_option_entity.dart';
import '../../datasource/redat_data_source.dart';
import '../../datasource/weyalaw_data_source.dart';
import '../../models/transport_place_model.dart';
import 'route_remote_impl.dart';

part 'i_route_remote.g.dart';

@Riverpod(keepAlive: true)
IRouteRepoRemote routeRepoRemote(Ref ref) {
  final redatDataSource = ref.read(redatDataSourceProvider);
  final weyalawDataSource = ref.read(weyalawDataSourceProvider);
  final locationService = LocationService.getInstance();
  return RouteRepoRemoteImpl(
      locationService, redatDataSource, weyalawDataSource);
}

abstract class IRouteRepoRemote {
  FutureResult<List<TransportPlace>> searchTransportPlaceByName(
      {required String name});
  FutureResult<List<TransportOptionEntity>> getTransportRouteFromTwoPoints(
      {required TransportPlace from,
      required TransportPlace to,
      bool skipCache = false});

  FutureResult<void> cacheLastedUsedDestination(
      {required TransportPlace destination});
  FutureResult<List<TransportPlace>> getLastedUsedDestination();
  FutureResult<void> cacheLastUsedOrigin({required TransportPlace origin});
  FutureResult<List<TransportPlace>> getLastUsedOrigins();
}
