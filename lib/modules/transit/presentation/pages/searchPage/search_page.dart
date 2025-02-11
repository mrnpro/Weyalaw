import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_find_taxi/_shared/presentation/widgets/app_container.dart';
import 'package:go_find_taxi/core/config/router/route_name.dart';
import 'package:go_find_taxi/core/utils/index.dart';
import 'package:go_find_taxi/modules/transit/presentation/dialogs/no_route_found_alert.dart';
import 'package:go_find_taxi/modules/transit/presentation/providers/getTransportRouteFromTwoPlace/get_transport_route_from_two_place_notifier.dart';
import 'package:go_find_taxi/modules/transit/presentation/widgets/background_map.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/transport_place_model.dart';
import '../../providers/searchRoute/search_route_notifier.dart';
import '../../../core/search_focus_enum.dart';
import 'components/components.dart';

class SearchPage extends StatefulHookConsumerWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPagePageState();
}

class _SearchPagePageState extends ConsumerState<SearchPage> {
  TransportPlace? from;
  TransportPlace? to;
  SearchFocus? currentFocus;
  bool showResult = false;
  @override
  void initState() {
    //ref.read(routeRepoRemoteProvider).searchFromCurrentLocation();
    _getCurrentAPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(getTransportRouteFromTwoPlaceNotifierProvider, (previous, next) {
      next.maybeWhen(
          success: (data) {
            if (data.isEmpty) {
              showNoRouteFoundAlert(context);
              return;
            }

            context.push(RouteName.transitOverview,
                extra: {'options': data, 'from': from, 'to': to});
          },
          orElse: () {});
    });
    return Scaffold(
      body: Stack(
        children: [
          _buildMap(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(20),
                  _buildBackBtn(),
                  _buildLocationPicker(),
                  const Gap(15),
                  // _buildSetANewDestination(),

                  _searchResult()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSetANewDestination() {
    return const SetNewDestination();
  }

  Widget _buildLocationPicker() {
    return LocationPicker(
        from: from, to: to, onFocusChange: (focus) => currentFocus = focus);
  }

  _buildBackBtn() {
    return const BackButtonWidget();
  }

  _buildMap() {
    return const BackgroundMap();
  }

  _searchResult() {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final searchRoute = ref.watch(searchRouteNotifierProvider);
        return searchRoute.maybeMap(
            success: (data) {
              return Builder(builder: (context) {
                final size = MediaQuery.sizeOf(context);
                return AppContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: size.height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Search Result",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(data.data.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    if (currentFocus == SearchFocus.from) {
                                      from = data.data[index];
                                      setState(() {});
                                    } else {
                                      to = data.data[index];
                                      setState(() {});
                                    }
                                    if (from != null && to != null) {
                                      ref
                                          .read(
                                              getTransportRouteFromTwoPlaceNotifierProvider
                                                  .notifier)
                                          .getTransportRouteFromTwoPoints(
                                              from: from!, to: to!);
                                    }

                                    ref.invalidate(searchRouteNotifierProvider);
                                  },
                                  child: AppContainer(
                                      isShadow: false,
                                      color: Colors.grey.withOpacity(.2),
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Text(data.data[index].name ?? "")),
                                );
                              })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  void _getCurrentAPlace() async {
    safeUiApiCall<TransportPlace>(context, apiCall: () async {
      final currentPlace = await TransportPlace.fromCurrentLocation();
      return currentPlace;
    }, onSuccess: (currentPlace) {
      if (currentFocus == null) from = currentPlace;
      setState(() {});
    }, onError: (error) {
      printError(error);
    });
  }
}
