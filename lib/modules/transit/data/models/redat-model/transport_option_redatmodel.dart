import '../../../entities/transport_option_entity.dart';
import 'place_redatmodel.dart';
import 'transport_step_redatmodel.dart';

class TransportOptionRedatModel extends TransportOptionEntity {
  const TransportOptionRedatModel({
    required super.option,
    required super.totalDuration,
    required super.totalPrice,
    required super.steps,
  });

  factory TransportOptionRedatModel.fromJson(Map<String, dynamic> json) {
    final routeList = (json['route'] as List<dynamic>)
        .map((e) => PlaceRedatModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final steps = (json['legs'] as List<dynamic>)
        .map((e) => TransportStepRedatModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return TransportOptionRedatModel(
      option: 'transit',
      totalDuration: json['duration'] as int,
      totalPrice: (json['total_price'] as num).toDouble(),
      steps: steps,
    );
  }

  Map<String, dynamic> toJson() => {
        'total_price': totalPrice,
        'duration': totalDuration,
        'legs':
            steps.map((e) => (e as TransportStepRedatModel).toJson()).toList(),
      };
}
