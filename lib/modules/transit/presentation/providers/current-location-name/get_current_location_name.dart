import 'dart:async';

import 'package:weyalaw/core/services/LocationService/location_service.dart';
import 'package:weyalaw/core/services/LocationService/models/reverse_geocoding_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_current_location_name.g.dart';

@riverpod
Future<ReverseGeocoding> currentLocationName(Ref ref) async {
  final locationService = LocationService.getInstance();
  final currentLocation = await locationService.getCurrentLocation();
  final locationNameResult =
      await locationService.reverseGeoCoding(currentLocation);
  return locationNameResult.first;
}
