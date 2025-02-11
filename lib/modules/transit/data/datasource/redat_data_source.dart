import 'package:weyalaw/core/handlers/result.dart';
import 'package:weyalaw/core/services/OnlineService/httpService/http_service.dart';
import 'package:weyalaw/modules/transit/data/datasource/transit_data_source.dart';
import 'package:weyalaw/modules/transit/data/models/transport_place_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/config/api/api_endpoints.dart';
import '../../../../core/handlers/failure/failure.dart';
import '../../../../core/handlers/success/success.dart';
import '../models/redat-model/transport_option_redatmodel.dart';

final redatDataSourceProvider = Provider<RedatDataSource>((ref) {
  final httpService = ref.read(httpServiceProvider);
  return RedatDataSource(httpService);
});

class RedatDataSource implements TransitDataSource {
  final HttpService _httpService;

  RedatDataSource(this._httpService);

  @override
  FutureResult<List<TransportOptionRedatModel>> getTransportRouteFromTwoPoints(
      {required TransportPlace from, required TransportPlace to}) async {
    try {
      final response = await _httpService.getRequest(
        urlPath: APIEndpoints.redatBaseUrl + APIEndpoints.redatRouteMap,
        queryParam: {
          'from': from.name,
          'to': to.name,
        },
        header: {
          'accept': '*/*',
          'accept-language': 'en-US,en;q=0.9',
          'origin': 'https://redat.vercel.app',
          'referer': 'https://redat.vercel.app/',
          'sec-fetch-dest': 'empty',
          'sec-fetch-mode': 'cors',
          'sec-fetch-site': 'cross-site',
        },
      );

      if (response.data == null) {
        return Failure.send(error: 'No data received from Redat API');
      }

      final options = [TransportOptionRedatModel.fromJson(response.data)];

      return Success.send(data: options);
    } catch (e) {
      return Failure.send(error: e);
    }
  }
}
