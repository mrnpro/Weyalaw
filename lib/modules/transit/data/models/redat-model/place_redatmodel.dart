import '../../../entities/place_entity.dart';
import 'coordinates_redatmodel.dart';

class PlaceRedatModel extends PlaceEntity {
  final String id;
  final List<String>? connectedRoutes;

  const PlaceRedatModel({
    required super.name,
    required super.coordinates,
    required this.id,
    this.connectedRoutes,
  });

  factory PlaceRedatModel.fromJson(Map<String, dynamic> json) => PlaceRedatModel(
        id: json['id'] as String,
        name: json['name'] as String,
        coordinates: CoordinatesRedatModel.fromJson(json['location'] as Map<String, dynamic>),
        connectedRoutes: (json['connected_routes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': (coordinates as CoordinatesRedatModel).toJson(),
        'connected_routes': connectedRoutes,
      };
}
