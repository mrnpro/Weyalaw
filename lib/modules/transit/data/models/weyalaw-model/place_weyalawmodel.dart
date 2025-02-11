import '../../../entities/place_entity.dart';
import 'coordinates_weyalawmodel.dart';

class PlaceWeyalawModel extends PlaceEntity {
  const PlaceWeyalawModel({
    required super.name,
    required super.coordinates,
  });

  factory PlaceWeyalawModel.fromJson(Map<String, dynamic> json) =>
      PlaceWeyalawModel(
        name: json['name'] as String,
        coordinates: CoordinatesWeyalawModel.fromJson(
            json['coordinates'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'placeName': name,
        'location': (coordinates as CoordinatesWeyalawModel).toJson(),
      };
}
