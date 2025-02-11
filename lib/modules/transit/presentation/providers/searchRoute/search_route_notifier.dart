import 'package:go_find_taxi/core/handlers/result.dart';
import 'package:go_find_taxi/modules/transit/data/repositories/remote/i_route_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'state/search_route_state.dart';
part 'search_route_notifier.g.dart';

@riverpod
class SearchRouteNotifier extends _$SearchRouteNotifier {
  @override
  SearchRouteState build() {
    // this is your build . you can return any state you want
    return const SearchRouteState.initial();
  }

  Future<void> search(String keyword) async {
    final repo = ref.read(routeRepoRemoteProvider);
    state = const SearchRouteState.loading();
    final res = await repo.searchTransportPlaceByName(name: keyword);
    state = res.fold(
      onFailure: (e) => SearchRouteState.failure(error: e.toString()),
      onSuccess: (data) => SearchRouteState.success(data: data.data),
    );
  }
}
