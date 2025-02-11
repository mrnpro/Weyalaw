import '../../../entities/coordinates_entity.dart';

class CoordinatesWeyalawModel extends CoordinatesEntity {
  const CoordinatesWeyalawModel({
    required super.lat,
    required super.lng,
  });

  factory CoordinatesWeyalawModel.fromJson(Map<String, dynamic> json) =>
      CoordinatesWeyalawModel(
        lat: json['lat'] as double,
        lng: json['lng'] as double, //
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
