import 'package:equatable/equatable.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

class CoordinatesEntity extends Equatable {
  final double lat;
  final double lng;

  const CoordinatesEntity({
    required this.lat,
    required this.lng,
  });

  LatLng toLatLng() => LatLng(lat, lng);

  @override
  List<Object?> get props => [lat, lng];
}
