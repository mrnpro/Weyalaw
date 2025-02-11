// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:weyalaw/core/config/theme/color_pallete.dart';
// import 'package:weyalaw/core/constants.dart';
// import 'package:weyalaw/core/services/LocationService/gebeta_maps_impl.dart';
// import 'package:weyalaw/core/utils/index.dart';
// import 'package:weyalaw/modules/transit/core/itinerary.dart';
// import 'package:weyalaw/modules/transit/data/models/plan/plan.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../../../../core/services/LocationService/location_service.dart';
// import '../../widgets/route_display_widget.dart';

// class StartNavigationScreen extends StatefulHookConsumerWidget {
//   const StartNavigationScreen(
//       {super.key, required this.plan, required this.index});
//   final Plan plan;

//   final int index;
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _StartNavigationScreenState();
// }

// class _StartNavigationScreenState extends ConsumerState<StartNavigationScreen> {
//   late GoogleMapController mapController;
//   Set<Polyline> polylines = {};
//   Set<Marker> markers = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchPolyline();
//     _addMarkers();
//   }

//   bool isFromOrigin({List<Step>? step}) {
//     try {
//       List<Step> legs0 = [];
//       if (legs == null) {
//         legs0 = widget.plan.itineraries!.shortestDistance.legs;
//       }
//       final fromPlace = legs0[widget.index].fromPlace.name;
//       final isOrigin = fromPlace == 'Origin';
//       return isOrigin;
//     } catch (e) {
//       printError(e);
//       return false;
//     }
//   }

//   Future<LatLng> getOrigin(List<Leg> legs) async {
//     var lat1 = 0.0;
//     var lng1 = 0.0;
//     final isOrigin = isFromOrigin(legs: legs);
//     if (isOrigin) {
//       final locationService = LocationService.getInstance();
//       final currentLocation = await locationService.getCurrentLocation();
//       lat1 = currentLocation.latitude;
//       lng1 = currentLocation.longitude;
//     } else {
//       lat1 = legs[widget.index].fromPlace.lat;
//       lng1 = legs[widget.index].fromPlace.lon;
//     }
//     return LatLng(lat1, lng1);
//   }

//   Future<LatLng> getDestination(List<Leg> legs) async {
//     var lat2 = 0.0;
//     var lng2 = 0.0;
//     final isOrigin = isFromOrigin(legs: legs);
//     if (isOrigin) {
//       lat2 = legs[widget.index].fromPlace.lat;
//       lng2 = legs[widget.index].fromPlace.lon;
//     } else {
//       lat2 = legs[widget.index].toPlace.lat;
//       lng2 = legs[widget.index].toPlace.lon;
//     }
//     return LatLng(lat2, lng2);
//   }

//   void _addMarkers() async {
//     final itinerary = widget.plan.itineraries!.shortestDistance;
//     // if the first is 'origin' lets asume that is our current location

//     final initial = await getOrigin(itinerary.legs);
//     final destination = await getDestination(itinerary.legs);
//     final isOrigin = isFromOrigin(legs: itinerary.legs);
//     final markerTitle = isOrigin ? "This is your current location" : 'Origin';
//     markers.add(
//       Marker(
//         markerId: const MarkerId('origin'),
//         position: initial,
//         infoWindow: InfoWindow(title: markerTitle),
//       ),
//     );
//     final markerTitle2 =
//         isOrigin ? "This is where taxis can be found" : 'Destination';
//     markers.add(
//       Marker(
//         markerId: const MarkerId('destination'),
//         position: destination,
//         infoWindow: InfoWindow(title: markerTitle2),
//       ),
//     );
//     setState(() {});
//   }

//   Future<void> fetchPolyline() async {
//     try {
//       final itinerary = widget.plan.itineraries!.shortestDistance;

//       final initial = await getOrigin(itinerary.legs);
//       final destination = await getDestination(itinerary.legs);
//       final locatioinService = LocationService.getInstance();
//       final direction = await locatioinService.geDirection(
//         origin: initial,
//         destination: destination,
//       );
//       polylines.add(
//         Polyline(
//           polylineId: const PolylineId('route'),
//           color: ColorPalette.primary,
//           width: 5,
//           points: [
//             ...direction?.polylinePoints ?? [],
//           ],
//         ),
//       );
//       setState(() {});
//     } catch (e) {
//       printError(e);
//     }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Expanded(
//         child: Stack(
//           children: [
//             GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(
//                   (widget.plan.itineraries!.shortestDistance.legs[widget.index]
//                       .fromPlace.lat),
//                   widget.plan.itineraries!.shortestDistance.legs[widget.index]
//                       .fromPlace.lon,
//                 ),
//                 zoom: _calculateZoomLevel(
//                   widget.plan.itineraries!.shortestDistance.legs[widget.index]
//                       .fromPlace.lat,
//                   widget.plan.itineraries!.shortestDistance.legs[widget.index]
//                       .fromPlace.lon,
//                   widget.plan.itineraries!.shortestDistance.legs[widget.index]
//                       .toPlace.lat,
//                   widget.plan.itineraries!.shortestDistance.legs[widget.index]
//                       .toPlace.lon,
//                 ),
//               ),
//               polylines: polylines,
//               markers: markers,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//             ),
//             SafeArea(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                 child: Column(
//                   children: [
//                     const Gap(20),
//                     RouteDisplayWidget(
//                         onTap: () {},
//                         from: widget.plan.itineraries!.shortestDistance
//                             .legs[widget.index].fromPlace.name,
//                         to: widget.plan.itineraries!.shortestDistance
//                             .legs[widget.index].toPlace.name),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 26),
//                 decoration: const BoxDecoration(
//                   color: ColorPalette.primary,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16),
//                       topRight: Radius.circular(16)),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 28, vertical: 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           context.pop();
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 6),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: const Icon(
//                             Icons.close,
//                             color: Colors.white,
//                             size: 40,
//                           ),
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             "${widget.plan.itineraries!.first.legs[widget.index].duration.inMinutes} min",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           Text(
//                             "${(widget.plan.itineraries!.first.legs[widget.index].distance / 1000).toStringAsFixed(1)} km to go",
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                                 color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 6),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: const Icon(
//                             Icons.map_outlined,
//                             color: Colors.white,
//                             size: 40,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   double _calculateZoomLevel(double lat, double lon, double lat2, double lon2) {
//     // Calculate the distance between points
//     final double latDiff = (lat2 - lat).abs();
//     final double lonDiff = (lon2 - lon).abs();

//     // Use the larger difference to determine zoom
//     final double maxDiff = latDiff > lonDiff ? latDiff : lonDiff;

//     // Convert to zoom level (smaller diff = higher zoom)
//     double zoomLevel = 12.0;
//     if (maxDiff <= 0.01) {
//       zoomLevel = 16.0;
//     } else if (maxDiff <= 0.05) {
//       zoomLevel = 13.0;
//     } else if (maxDiff <= 0.1) {
//       zoomLevel = 11.0;
//     } else if (maxDiff <= 0.5) {
//       zoomLevel = 9.0;
//     }

//     return zoomLevel;
//   }
// }
