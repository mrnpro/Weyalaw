import 'package:go_find_taxi/core/handlers/result.dart';
import 'package:go_find_taxi/modules/transit/data/models/transport_place_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/repositories/remote/i_route_remote.dart';
import 'state/get_transport_route_from_two_place_state.dart';
part 'get_transport_route_from_two_place_notifier.g.dart';

@riverpod
class GetTransportRouteFromTwoPlaceNotifier
    extends _$GetTransportRouteFromTwoPlaceNotifier {
  @override
  GetTransportRouteFromTwoPlaceState build() {
    // this is your build . you can return any state you want
    return const GetTransportRouteFromTwoPlaceState.initial();
  }

  Future<void> getTransportRouteFromTwoPoints(
      {required TransportPlace from, required TransportPlace to}) async {
    final result = await ref
        .read(routeRepoRemoteProvider)
        .getTransportRouteFromTwoPoints(from: from, to: to);
    state = result.fold(
      onFailure: (l) =>
          GetTransportRouteFromTwoPlaceState.failure(error: l.message ?? ""),
      onSuccess: (r) =>
          GetTransportRouteFromTwoPlaceState.success(data: r.data),
    );
  }
}
