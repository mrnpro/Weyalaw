import 'dart:math';

double calculateDistance(
    double latitude1, double longitude1, double latitude2, double longitude2) {
  const double earthRadius = 6371.0; // Earth's radius in kilometers

  final double dLat = _degreesToRadians(latitude2 - latitude1);
  final double dLon = _degreesToRadians(longitude2 - longitude1);

  final double a = (sin(dLat / 2) * sin(dLat / 2)) +
      cos(_degreesToRadians(latitude1)) *
          cos(_degreesToRadians(latitude2)) *
          (sin(dLon / 2) * sin(dLon / 2));

  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c;
}

double _degreesToRadians(double degrees) {
  return degrees * (pi / 180);
}
