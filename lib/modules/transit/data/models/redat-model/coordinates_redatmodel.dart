import '../../../entities/coordinates_entity.dart';

class CoordinatesRedatModel extends CoordinatesEntity {
  const CoordinatesRedatModel({
    required super.lat,
    required super.lng,
  });

  factory CoordinatesRedatModel.fromJson(Map<String, dynamic> json) {
    final coordinates = json['coordinates'] as List<dynamic>;
    return CoordinatesRedatModel(
      lng: coordinates[0] as double,
      lat: coordinates[1] as double,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': 'Point',
        'coordinates': [lng, lat],
      };
}
