import 'package:equatable/equatable.dart';
import 'coordinates_entity.dart';

class PlaceEntity extends Equatable {
  final String name;
  final CoordinatesEntity coordinates;

  const PlaceEntity({
    required this.name,
    required this.coordinates,
  });

  @override
  List<Object?> get props => [name, coordinates];
}
