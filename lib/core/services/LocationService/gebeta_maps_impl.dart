import 'dart:convert';

import 'package:go_find_taxi/core/services/LocationService/models/direction.dart';
import 'package:go_find_taxi/core/services/LocationService/models/geo_coding_response.dart';
import 'package:go_find_taxi/core/services/LocationService/models/reverse_geocoding_response.dart';
import 'package:go_find_taxi/core/utils/index.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:http/http.dart' as http;
import 'location_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GebetaMapsImpl extends LocationService {
  final String apiKey = dotenv.env['GEBETA_MAPS_API_KEY'] ?? '';
  final String baseUrl = "https://mapapi.gebeta.app/api/v1/route";
  @override
  Future<Direction?> geDirection(
      {required LatLng origin, required LatLng destination}) async {
    String lat1 = origin.latitude.toString();
    String lon1 = origin.longitude.toString();
    String lat2 = destination.latitude.toString();
    String lon2 = destination.longitude.toString();
    final baseUrl2 = baseUrl.replaceAll('/v1', '');
    String url =
        "$baseUrl2/direction/?origin={$lat1,$lon1}&destination={$lat2,$lon2}&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        return Direction.fromMap(data);
      } else {
        throw Exception('Error: ${response.body}');
      }
    } catch (e) {
      printError('An error occurred: $e');
      rethrow;
    }
  }

  @override
  Future<List<GeoCoding>> geoCoding(String placeName) async {
    try {
      String url = "$baseUrl/geocoding?name=$placeName&apiKey=$apiKey";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        final data = decoded['data'];
        final geoCoding = <GeoCoding>[];
        for (var e in data) {
          geoCoding.add(GeoCoding.fromJson(e));
        }
        return geoCoding;
      } else {
        throw Exception('Error: ${response.body}');
      }
    } catch (e) {
      printError('Error getting geo coding: $e');
      rethrow;
    }
  }

  @override
  Future<List<ReverseGeocoding>> reverseGeoCoding(LatLng latLng) async {
    try {
      String url =
          "$baseUrl/revgeocoding?lat=${latLng.latitude}&lon=${latLng.longitude}&apiKey=$apiKey";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        final List<ReverseGeocoding> reverseGeoCodeing = [];
        print(reverseGeoCodeing);
        for (var element in data['data']) {
          reverseGeoCodeing.add(ReverseGeocoding.fromJson(element));
        }
        return reverseGeoCodeing;
      } else {
        throw Exception('Error: ${response.body}');
      }
    } catch (e) {
      printError('Error getting reverse geocoding: $e');
      rethrow;
    }
  }

  @override
  Future<String> getPlaceNameByLatLng(LatLng latLng) async {
    try {
      final rvCodings = await reverseGeoCoding(latLng);
      return rvCodings.firstOrNull?.name ?? "Unknown Place";
    } catch (e) {
      rethrow;
    }
  }
}
