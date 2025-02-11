import 'dart:convert';
import 'package:weyalaw/core/config/api/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:weyalaw/core/services/LocationService/models/direction.dart';
import 'package:weyalaw/core/services/LocationService/models/geo_coding_response.dart';
import 'package:weyalaw/core/services/LocationService/models/reverse_geocoding_response.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'location_service.dart';

class FromServerImpl extends LocationService {
  final String baseUrl = APIEndpoints.baseUrl;

  @override
  Future<Direction?> geDirection({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final url = Uri.parse(
        '$baseUrl${APIEndpoints.directions}?originLat=${origin.latitude}&originLng=${origin.longitude}'
        '&destLat=${destination.latitude}&destLng=${destination.longitude}',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Direction.fromMap(data);
      } else {
        throw Exception('Failed to get directions: ${response.body}');
      }
    } catch (e) {
      print('Error getting directions: $e');
      return null;
    }
  }

  @override
  Future<List<GeoCoding>> geoCoding(String placeName) async {
    try {
      final url = Uri.parse(
          '$baseUrl${APIEndpoints.geocode}?placeName=${Uri.encodeComponent(placeName)}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => GeoCoding.fromJson(e)).toList();
      } else {
        throw Exception('Failed to geocode: ${response.body}');
      }
    } catch (e) {
      print('Error geocoding: $e');
      return [];
    }
  }

  @override
  Future<String> getPlaceNameByLatLng(LatLng latLng) async {
    try {
      final url = Uri.parse(
        '$baseUrl${APIEndpoints.placeName}?lat=${latLng.latitude}&lng=${latLng.longitude}',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['placeName'] ?? 'Unknown Place';
      } else {
        throw Exception('Failed to get place name: ${response.body}');
      }
    } catch (e) {
      print('Error getting place name: $e');
      return 'Unknown Place';
    }
  }

  @override
  Future<List<ReverseGeocoding>> reverseGeoCoding(LatLng latLng) async {
    try {
      final url = Uri.parse(
        '$baseUrl${APIEndpoints.reverseGeocode}?lat=${latLng.latitude}&lng=${latLng.longitude}',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => ReverseGeocoding.fromJson(e)).toList();
      } else {
        throw Exception('Failed to reverse geocode: ${response.body}');
      }
    } catch (e) {
      print('Error reverse geocoding: $e');
      return [];
    }
  }
}
