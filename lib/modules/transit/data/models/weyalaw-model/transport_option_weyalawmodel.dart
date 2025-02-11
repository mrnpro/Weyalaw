import '../../../entities/transport_option_entity.dart';
import 'transport_step_weyalawmodel.dart';

class TransportOptionWeyalawModel extends TransportOptionEntity {
  const TransportOptionWeyalawModel({
    required super.option,
    required super.totalDuration,
    required super.totalPrice,
    required super.steps,
  });

  factory TransportOptionWeyalawModel.fromJson(Map<String, dynamic> json) =>
      TransportOptionWeyalawModel(
        option: json['option'] as String,
        totalDuration: json['totalDuration'] as int,
        totalPrice: (json['totalPrice'] as num).toDouble(),
        steps: (json['steps'] as List<dynamic>)
            .map((e) =>
                TransportStepWeyalawModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'routeType': option,
        'totalDuration': totalDuration,
        'totalPrice': totalPrice,
        'steps': steps
            .map((e) => (e as TransportStepWeyalawModel).toJson())
            .toList(),
      };
}
