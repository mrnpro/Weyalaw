import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/route_model.dart';

part 'transport_route_state.freezed.dart';

@freezed
class TransportRouteState with _$TransportRouteState {
  const factory TransportRouteState.initial() = _Initial;
  const factory TransportRouteState.loading() = _Loading;
  const factory TransportRouteState.gettingCurrentLocation() =
      _GettingCurrentLocation;
  const factory TransportRouteState.success(List<TransportRoute> data) =
      _Success;
  const factory TransportRouteState.failure({required String error}) = _Failure;
}
