import 'package:go_find_taxi/modules/transit/entities/transport_option_entity.dart';

import '../../../../core/handlers/result.dart';
import '../models/transport_place_model.dart';

abstract class TransitDataSource {
  FutureResult<List<TransportOptionEntity>> getTransportRouteFromTwoPoints(
      {required TransportPlace from, required TransportPlace to});
}
