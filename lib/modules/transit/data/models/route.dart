import 'package:google_maps_widget/google_maps_widget.dart';

class Route {
  final String name;
  final double price;
  final List<LatLng>? coordinates;

  Route({
    required this.name,
    required this.price,
    this.coordinates,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      name: json['name'],
      price: json['price'],
    );
  }
}
