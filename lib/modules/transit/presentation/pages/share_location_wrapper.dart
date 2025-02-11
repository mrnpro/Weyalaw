import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_find_taxi/modules/transit/data/models/transport_place_model.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

import '../../../../core/config/router/route_name.dart';

class ShareLocationWrapper extends ConsumerStatefulWidget {
  final double latitude;
  final double longitude;

  const ShareLocationWrapper({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  ConsumerState<ShareLocationWrapper> createState() =>
      _ShareLocationWrapperState();
}

class _ShareLocationWrapperState extends ConsumerState<ShareLocationWrapper> {
  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    try {
      // Get current location as 'from' place
      final fromPlace = await TransportPlace.fromCurrentLocation();

      // Create destination place from shared coordinates
      final toPlace = TransportPlace(
        name: 'Shared Location',
        coordinates: LatLng(widget.latitude, widget.longitude),
      );

      // Navigate to transit overview
      if (mounted) {
        context.pushReplacement(RouteName.transitOverview, extra: {
          'from': fromPlace,
          'to': toPlace,
          //   'plan': const Plan(), // You might want to fetch the actual plan here
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
