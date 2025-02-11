import 'package:google_maps_widget/google_maps_widget.dart';

class Direction {
  const Direction({
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  /// to display the route.
  final List<LatLng> polylinePoints;

  /// The total distance between the source and the destination.
  final String totalDistance;

  /// The total time between the source and the destination.
  final String totalDuration;

  /// Private constructor for [Direction] which receives a map from the
  /// api request and maps the response to the class variables.
  factory Direction.fromMap(Map<String, dynamic> map) {
    // Get route information
    final data = map;

    // Create list of LatLng points from direction array
    final List<LatLng> points = [];
    for (var point in data['direction']) {
      points.add(LatLng(point[0], point[1]));
    }

    return Direction(
      polylinePoints: points,
      totalDistance: data['totalDistance'].toString(),
      totalDuration: data['timetaken'].toString(),
    );
  }
}
