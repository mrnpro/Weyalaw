import 'package:equatable/equatable.dart';
import 'transport_step_entity.dart';

class TransportOptionEntity extends Equatable {
  final String option;
  final int totalDuration;
  final double totalPrice;
  final List<TransportStepEntity> steps;

  const TransportOptionEntity({
    required this.option,
    required this.totalDuration,
    required this.totalPrice,
    required this.steps,
  });

  @override
  List<Object?> get props => [
        option,
        totalDuration,
        totalPrice,
        steps,
      ];
}
