import 'package:weyalaw/modules/transit/data/models/redat-model/coordinates_redatmodel.dart';

import '../../../entities/transport_step_entity.dart';
import 'place_redatmodel.dart';

class TransportStepRedatModel extends TransportStepEntity {
  const TransportStepRedatModel({
    required super.fromPlace,
    required super.toPlace,
    required super.duration,
    required super.action,
    required super.isTransit,
    required super.price,
  });

  factory TransportStepRedatModel.fromJson(Map<String, dynamic> json) {
    final from = json['route']['0'];
    final to = json['route']['1'];
    return TransportStepRedatModel(
      fromPlace: PlaceRedatModel(
        id: from['id'] as String,
        name: from['name'] as String,
        coordinates: CoordinatesRedatModel.fromJson(from['location']),
      ),
      toPlace: PlaceRedatModel(
        id: to['id'] as String,
        name: to['name'] as String,
        coordinates: CoordinatesRedatModel.fromJson(to['location']),
      ),
      duration: 0, // Redat API provides this at the route level
      action: 'transit', // Default action for Redat
      isTransit: true, // Always true for Redat
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'from': fromPlace.name,
        'to': toPlace.name,
        'price': price,
      };
}
