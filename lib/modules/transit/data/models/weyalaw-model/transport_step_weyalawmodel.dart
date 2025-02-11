import '../../../entities/transport_step_entity.dart';
import 'place_weyalawmodel.dart';

class TransportStepWeyalawModel extends TransportStepEntity {
  const TransportStepWeyalawModel({
    required super.fromPlace,
    required super.toPlace,
    required super.duration,
    required super.action,
    required super.isTransit,
    required super.price,
  });

  factory TransportStepWeyalawModel.fromJson(Map<String, dynamic> json) =>
      TransportStepWeyalawModel(
        fromPlace: PlaceWeyalawModel.fromJson(
            json['fromPlace'] as Map<String, dynamic>),
        toPlace:
            PlaceWeyalawModel.fromJson(json['toPlace'] as Map<String, dynamic>),
        duration: json['duration'] as int,
        action: json['action'] as String,
        isTransit: json['isTransit'] as bool,
        price: (json['price'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'source': (fromPlace as PlaceWeyalawModel).toJson(),
        'destination': (toPlace as PlaceWeyalawModel).toJson(),
        'travelTime': duration,
        'travelMode': action,
        'isPublicTransport': isTransit,
        'fare': price,
      };
}
