import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_find_taxi/_shared/presentation/widgets/app_container.dart';
import 'package:go_find_taxi/core/config/router/route_name.dart';
import 'package:go_find_taxi/core/config/theme/color_pallete.dart';
import 'package:go_find_taxi/core/constants/assets.dart';
import 'package:go_find_taxi/core/extentions/app_shimmer.dart';
import 'package:go_find_taxi/core/utils/src/color_utils.dart';
import 'package:go_find_taxi/modules/transit/presentation/providers/current-location-name/get_current_location_name.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants.dart';
import '../../transit/presentation/providers/get-recent-transits/recent_transits_provider.dart';
import '../../transit/presentation/providers/transportRoute/transport_route_notifier.dart';
import '../../transit/presentation/widgets/transport_routes_list.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final timer = Timer.periodic(const Duration(minutes: 3), (timer) {
        // ref.invalidate(currentLocationNameProvider);
        // ref.invalidate(getRecentTransitsProvider);
        // ref.invalidate(fetchLastRoutesProvider);
      });
      return () {
        timer.cancel();
      };
    }, []);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            //ref.invalidate(currentLocationNameProvider);
            return Future.wait([
              ref.refresh(getRecentTransitsProvider.future),
              ref.refresh(fetchLastRoutesProvider.future)
            ]);
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.menu)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications))
                        ],
                      ),
                      const Gap(10),
                      SizedBox(
                        width: size.width,
                        height: 50,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  context.push(RouteName.search);
                                },
                                child: const AppContainer(
                                  child: Row(
                                    children: [
                                      Icon(Icons.search, color: Colors.grey),
                                      Text('Search for place'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            AppContainer(
                                height: 50,
                                width: 50,
                                child:
                                    SvgPicture.asset(Assets.assetsSvgsFilter)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const Gap(20),
                      Consumer(
                        builder: (_, WidgetRef ref, __) {
                          final currentLocationName =
                              ref.watch(currentLocationNameProvider);
                          final isLoading = currentLocationName.isLoading;

                          return AppContainer(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 61,
                                        height: 61,
                                        child: Image.asset(
                                            Assets.assetsImagesLocationAvatar)),
                                    const Gap(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Your Location",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            )),
                                        currentLocationName.maybeWhen(
                                            data: (data) => Text(
                                                  data.name ??
                                                      "Unknown Location",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                            orElse: () => const Text(
                                                    "Getting Your Location ")
                                                .appShimmer())
                                      ],
                                    )
                                  ],
                                ),
                                const Gap(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: HexColor("#BCDEFF"),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text("08:20 PM",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: HexColor("#0082FF"),
                                              )),
                                        ),
                                        const Gap(10),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(.42),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Text("23°S, 45°N",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              )),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF334BC3)
                                            .withOpacity(.43),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Text("+3 GMT",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF334BC3),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const Gap(20),
                      SizedBox(
                        height: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: AppContainer(
                                color: ColorPalette.primary,
                                child: SizedBox(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.assetsSvgsBusService,
                                    ),
                                    const Gap(5),
                                    const Text("Taxi Service",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                )),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: AppContainer(
                                color: ColorPalette.grey.withOpacity(.3),
                                child: SizedBox(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.assetsSvgsBusService,
                                    ),
                                    const Gap(5),
                                    const Text("Bus Service",
                                        style: TextStyle(
                                          color: ColorPalette.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const TransportRoutesList()
            ],
          ),
        ),
      ),
    );
  }
}
