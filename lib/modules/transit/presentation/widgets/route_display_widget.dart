import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:weyalaw/core/config/theme/color_pallete.dart';
import 'package:weyalaw/core/constants/assets.dart';
import 'package:weyalaw/core/extentions/app_shimmer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../_shared/presentation/widgets/app_container.dart';

class RouteDisplayWidget extends HookConsumerWidget {
  const RouteDisplayWidget({
    super.key,
    required this.onTap,
    required this.from,
    required this.to,
  });
  final FutureOr<void> Function() onTap;
  final String from;
  final String to;
  @override
  Widget build(BuildContext context, ref) {
    final isLoading = useState(false);
    useEffect(() {
      // if is loading for a while , turn it off
      final timer = Timer(const Duration(seconds: 10), () {
        isLoading.value = false;
      });
      return () {
        timer.cancel();
      };
    }, []);
    final widget =
        isLoading.value ? _loadingWhenPressed(isLoading) : _widget(isLoading);
    return Column(
      children: [
        widget,
        const Gap(10),
      ],
    );
  }

  Widget _loadingWhenPressed(ValueNotifier<bool> isLoading) {
    return Stack(
      children: [
        _widget(isLoading),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorPalette.primary, width: 3),
            ),
          ).appShimmer(),
        ),
      ],
    );
  }

  Column _widget(ValueNotifier<bool> isLoading) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            isLoading.value = true;
            await onTap();
            isLoading.value = false;
          },
          child: AppContainer(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  from,
                  maxLines: 2,
                )),
                const Gap(5),
                if (isLoading.value)
                  SvgPicture.asset(Assets.assetsSvgsRouteProgress).appShimmer(),
                if (!isLoading.value)
                  SvgPicture.asset(Assets.assetsSvgsRouteProgress),
                const Gap(5),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      to,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
