import 'dart:convert';

import 'package:weyalaw/core/handlers/result.dart';
import 'package:weyalaw/core/handlers/success/success.dart';
import 'package:weyalaw/core/services/LocationService/location_service.dart';
import 'package:weyalaw/core/services/index.dart';
import 'package:weyalaw/core/utils/index.dart';
import 'package:weyalaw/main.dart';
import 'package:weyalaw/modules/transit/data/datasource/transit_data_source.dart';
import 'package:weyalaw/modules/transit/data/models/transport_place_model.dart';
import 'package:weyalaw/modules/transit/entities/transport_option_entity.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/handlers/failure/failure.dart';
import '../../datasource/redat_data_source.dart';
import '../../datasource/weyalaw_data_source.dart';
import '../../models/route_model.dart';
import 'i_route_remote.dart';

class RouteRepoRemoteImpl implements IRouteRepoRemote {
  final LocationService locationService;
  final RedatDataSource redatDataSource;
  final WeyalawDataSource weyalawDataSource;
  RouteRepoRemoteImpl(
      this.locationService, this.redatDataSource, this.weyalawDataSource);

  @override
  FutureResult<List<TransportPlace>> searchTransportPlaceByName(
      {required String name}) async {
    try {
      final predictions = await locationService.geoCoding(name);

      final places =
          predictions.map((e) => TransportPlace.fromGeoCoding(e)).toList();
      return Success.send(data: places);
    } catch (e) {
      return Failure.send(error: e.toString());
    }
  }

  @override
  FutureResult<List<TransportOptionEntity>> getTransportRouteFromTwoPoints(
      {required TransportPlace from,
      required TransportPlace to,
      bool skipCache = false}) async {
    try {
      final options = <TransportOptionEntity>[];

      /// if from is Current Location , then fetch the new origin based on the name
      if (from.name == currentLocationString) {
        final locationName = await LocationService.getInstance()
            .getPlaceNameByLatLng(from.coordinates!);
        from = from.copyWith(name: locationName);
      }

      /// initially lets check for Redat
      final redatResponse = await getTransportRoute(
          dataSource: redatDataSource, from: from, to: to);

      if (redatResponse.failure == null) {
        options.addAll(redatResponse.success?.data ?? []);
      } else {
        final weyalawResponse = await getTransportRoute(
            dataSource: weyalawDataSource, from: from, to: to);

        if (weyalawResponse.failure != null) {
          return Failure.send(
              error: weyalawResponse.failure?.message ??
                  "Failed to fetch transport route");
        }
        options.addAll(weyalawResponse.success?.data ?? []);
      }
      if (!skipCache) {
        cacheLastedUsedDestination(destination: to);
        cacheLastUsedOrigin(origin: from);
      }
      return Success.send(data: options);
    } catch (e) {
      return Failure.send(error: e);
    }
  }

  FutureResult<List<TransportOptionEntity>> getTransportRoute(
      {required TransportPlace from,
      required TransportPlace to,
      required TransitDataSource dataSource}) async {
    return await dataSource.getTransportRouteFromTwoPoints(from: from, to: to);
  }

  @override
  FutureResult<void> cacheLastedUsedDestination(
      {required TransportPlace destination}) async {
    try {
      final destinations = <TransportPlace>[];
      // first lets fetch the last used destinations
      final lastUsedDestinationResult = await getLastedUsedDestination();
      if (lastUsedDestinationResult.failure != null) {
        return Failure.send(error: "Failed to fetch last used destinations");
      }
      final lastUsedDestination = lastUsedDestinationResult.success?.data;

      /// add the last used destinations to the list
      destinations.addAll(lastUsedDestination ?? []);
      destinations.add(destination);
      // lets use the first 5 destinations
      // destinations.take(5);

      final destinationsToCache = destinations.map((e) => e).toList();
      final localStroageService = container.read(localStorageServiceProvider);
      final encodedDestinations = jsonEncode(destinationsToCache);

      await localStroageService.write(
          key: kLastUsedDestinationKey, value: encodedDestinations);
      return Success.send(data: unit);
    } catch (e) {
      return Failure.send(error: e);
    }
  }

  @override
  FutureResult<List<TransportPlace>> getLastedUsedDestination() async {
    final localStroageService = container.read(localStorageServiceProvider);
    try {
      final lastUsedDestination =
          await localStroageService.read(key: kLastUsedDestinationKey);
      if (lastUsedDestination == null) {
        return Success.send(data: []);
      }
      final destinationsDecoded = jsonDecode(lastUsedDestination);
      printLog(destinationsDecoded);
      final destinations = <TransportPlace>[];
      for (var e in destinationsDecoded) {
        destinations.add(TransportPlace.fromMap(e));
      }
      return Success.send(data: destinations.reversed.toList());
    } catch (e) {
      //localStroageService.clear(key: kLastUsedDestinationKey);
      return Failure.send(error: e);
    }
  }

  @override
  FutureResult<void> cacheLastUsedOrigin(
      {required TransportPlace origin}) async {
    try {
      final origins = <TransportPlace>{};
      // first lets fetch the last used destinations
      final lastUsedDestinationResult = await getLastedUsedDestination();
      if (lastUsedDestinationResult.failure != null) {
        return Failure.send(error: "Failed to fetch last used destinations");
      }
      final lastUsedDestination = lastUsedDestinationResult.success?.data;

      // if the currentOrigin is Current Location , then fetch the new origin based on the name and copywith the new one
      if (origin.name == currentLocationString) {
        final locationName = await LocationService.getInstance()
            .getPlaceNameByLatLng(origin.coordinates!);
        origin = origin.copyWith(name: locationName);
      }

      /// add the last used destinations to the list
      origins.addAll(lastUsedDestination ?? []);
      origins.add(origin);
      // lets use the first 5 destinations
      // origins.take(5);

      final originsToCache = origins.map((e) => e).toList();
      final localStroageService = container.read(localStorageServiceProvider);
      final encodedOrigins = jsonEncode(originsToCache);

      await localStroageService.write(
          key: kLastUsedOriginKey, value: encodedOrigins);
      return Success.send(data: unit);
    } catch (e) {
      return Failure.send(error: e);
    }
  }

  @override
  FutureResult<List<TransportPlace>> getLastUsedOrigins() async {
    final localStorageService = container.read(localStorageServiceProvider);
    try {
      final lastUsedOrigins =
          await localStorageService.read(key: kLastUsedOriginKey);
      if (lastUsedOrigins == null) {
        return Success.send(data: []);
      }
      final originsDecoded = jsonDecode(lastUsedOrigins);
      printLog(originsDecoded);
      final origins = <TransportPlace>[];
      for (var e in originsDecoded) {
        origins.add(TransportPlace.fromMap(e));
      }

      return Success.send(data: origins.reversed.toList());
    } catch (e) {
      return Failure.send(error: e);
    }
  }
}
