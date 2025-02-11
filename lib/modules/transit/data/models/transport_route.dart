import 'package:google_maps_widget/google_maps_widget.dart';
import 'route.dart'; // Import the new Route model

class TransportRoute {
  final String initialPoint;
  final String destination;
  final double distance; // in km
  final bool availability;
  final List<Route> routes; // List of Route objects
  final double price; // Estimated price for the transport route
  final List<LatLng> coordinates;

  TransportRoute({
    required this.initialPoint,
    required this.destination,
    required this.distance,
    required this.availability,
    required this.routes,
    required this.price,
    required this.coordinates,
  });

  factory TransportRoute.fromJson(Map<String, dynamic> json) {
    return TransportRoute(
      initialPoint: json['initialPoint'],
      destination: json['destination'],
      distance: json['distance'],
      availability: json['availability'],
      routes: (json['routes'] as List)
          .map((route) => Route.fromJson(route))
          .toList(),
      price: json['price'],
      coordinates: (json['coordinates'] as List<String>).map((coord) {
        final parts = coord.split(',');
        return LatLng(double.parse(parts[0]), double.parse(parts[1]));
      }).toList(),
    );
  }
}
