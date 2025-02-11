import 'package:go_find_taxi/core/handlers/result.dart';
import 'package:go_find_taxi/core/services/OnlineService/httpService/http_service.dart';
import 'package:go_find_taxi/modules/transit/data/datasource/transit_data_source.dart';
import 'package:go_find_taxi/modules/transit/data/models/transport_place_model.dart';
import 'package:go_find_taxi/modules/transit/data/models/weyalaw-model/transport_option_weyalawmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/config/api/api_endpoints.dart';
import '../../../../core/handlers/failure/failure.dart';
import '../../../../core/handlers/success/success.dart';

final weyalawDataSourceProvider = Provider<WeyalawDataSource>((ref) {
  final httpService = ref.read(httpServiceProvider);
  return WeyalawDataSource(httpService);
});

class WeyalawDataSource implements TransitDataSource {
  final HttpService _httpService;

  WeyalawDataSource(this._httpService);
  @override
  FutureResult<List<TransportOptionWeyalawModel>>
      getTransportRouteFromTwoPoints(
          {required TransportPlace from, required TransportPlace to}) async {
    try {
      final response = await _httpService
          .getRequest(urlPath: APIEndpoints.transportOptions, queryParam: {
        'from': '${from.coordinates?.latitude},${from.coordinates?.longitude}',
        'to': '${to.coordinates?.latitude},${to.coordinates?.longitude}',
      });
      final options = <TransportOptionWeyalawModel>[];
      for (var option in response.data) {
        options.add(TransportOptionWeyalawModel.fromJson(option));
      }
      return Success.send(data: options);
    } catch (e) {
      return Failure.send(error: e);
    }
  }
}
