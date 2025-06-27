import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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

extension TransportStepEntityX on TransportStepEntity {
  Icon get getActionIcon {
    final action = this.action.toUpperCase();
    if (action == 'WALK') {
      return const Icon(Icons.directions_walk, size: 16);
    }
    return const Icon(Icons.directions_bus, size: 16);
  }
}
