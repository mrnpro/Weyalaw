import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../entities/transport_option_entity.dart';

part 'get_transport_route_from_two_place_state.freezed.dart';

@freezed
class GetTransportRouteFromTwoPlaceState
    with _$GetTransportRouteFromTwoPlaceState {
  const factory GetTransportRouteFromTwoPlaceState.initial() = _Initial;
  const factory GetTransportRouteFromTwoPlaceState.loading() = _Loading;
  const factory GetTransportRouteFromTwoPlaceState.success(
      {required List<TransportOptionEntity> data}) = _Success;
  const factory GetTransportRouteFromTwoPlaceState.failure(
      {required String error}) = _Failure;
}
