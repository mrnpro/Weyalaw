import 'package:equatable/equatable.dart';
import 'place_entity.dart';

class TransportStepEntity extends Equatable {
  final PlaceEntity fromPlace;
  final PlaceEntity toPlace;
  final int duration;
  final String action;
  final bool isTransit;
  final double price;

  const TransportStepEntity({
    required this.fromPlace,
    required this.toPlace,
    required this.duration,
    required this.action,
    required this.isTransit,
    required this.price,
  });

  @override
  List<Object?> get props => [
        fromPlace,
        toPlace,
        duration,
        action,
        isTransit,
        price,
      ];
}
