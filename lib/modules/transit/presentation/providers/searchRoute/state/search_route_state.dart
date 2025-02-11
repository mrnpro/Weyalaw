import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/transport_place_model.dart';

part 'search_route_state.freezed.dart';

@freezed
class SearchRouteState with _$SearchRouteState {
  const factory SearchRouteState.initial() = _Initial;
  const factory SearchRouteState.loading() = _Loading;
  const factory SearchRouteState.success({required List<TransportPlace> data}) =
      _Success;
  const factory SearchRouteState.failure({required String error}) = _Failure;
}
