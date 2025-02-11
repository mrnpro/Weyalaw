import 'package:go_find_taxi/core/services/LocationService/location_service.dart';
import 'package:go_find_taxi/core/services/LocationService/models/direction.dart';
import 'package:go_find_taxi/core/services/LocationService/models/geo_coding_response.dart';
import 'package:go_find_taxi/core/services/LocationService/models/reverse_geocoding_response.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class GoogleMapImpl extends LocationService {
  @override
  Future<Direction?> geDirection(
      {required LatLng origin, required LatLng destination}) {
    // TODO: implement geDirection
    throw UnimplementedError();
  }

  @override
  Future<List<GeoCoding>> geoCoding(String placeName) {
    // TODO: implement geoCoding
    throw UnimplementedError();
  }

  @override
  Future<LatLng> getCurrentLocation() {
    // TODO: implement getCurrentLocation
    throw UnimplementedError();
  }

  @override
  Future<String> getPlaceNameByLatLng(LatLng latLng) {
    // TODO: implement getPlaceNameByLatLng
    throw UnimplementedError();
  }

  @override
  Future<List<ReverseGeocoding>> reverseGeoCoding(LatLng latLng) {
    // TODO: implement reverseGeoCoding
    throw UnimplementedError();
  }
}
