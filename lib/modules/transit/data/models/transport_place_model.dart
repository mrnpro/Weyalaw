import 'package:weyalaw/core/constants.dart';
import 'package:weyalaw/core/services/LocationService/location_service.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

import '../../../../core/services/LocationService/models/geo_coding_response.dart';

class TransportPlace {
  final String? name;

  final LatLng? coordinates;

  TransportPlace({
    this.name,
    this.coordinates,
  });

  factory TransportPlace.fromJson(List<dynamic>? json) {
    if (json == null) return TransportPlace();

    return TransportPlace(
      name: json[0] as String?,
      coordinates: json[3] != null
          ? LatLng(json[3][1].toDouble(), json[3][0].toDouble())
          : null,
    );
  }
  static Future<TransportPlace> fromCurrentLocation() async {
    final currentLocation =
        await LocationService.getInstance().getCurrentLocation();
    return TransportPlace(
        name: currentLocationString, coordinates: currentLocation);
  }

  factory TransportPlace.fromMap(Map<String, dynamic> map) {
    return TransportPlace(
      name: map['name'] as String?,
      coordinates: map['coordinates'] != null
          ? LatLng(map['coordinates'][1].toDouble(),
              map['coordinates'][0].toDouble())
          : null,
    );
  }

  factory TransportPlace.fromGeoCoding(GeoCoding geoCoding) {
    return TransportPlace(
      name: geoCoding.name,
      coordinates: LatLng(geoCoding.latitude?.toDouble() ?? 0,
          geoCoding.longitude?.toDouble() ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name, // index 0
      'coordinates': coordinates != null // index 3
          ? [coordinates!.longitude, coordinates!.latitude]
          : null,
    };
  }

  @override
  String toString() {
    return '${coordinates?.latitude}, ${coordinates?.longitude}';
  }

  /// Creates a copy of this TransportPlace but with the given fields replaced with the new values.
  TransportPlace copyWith({
    String? name,
    LatLng? coordinates,
  }) {
    return TransportPlace(
      name: name ?? this.name,
      coordinates: coordinates ?? this.coordinates,
    );
  }
}
