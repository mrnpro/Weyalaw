import 'package:flutter/material.dart';

class RideDetailsScreen extends StatelessWidget {
  final String rideId;

  const RideDetailsScreen({super.key, required this.rideId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ride Details Screen - ID: $rideId'),
      ),
    );
  }
}
