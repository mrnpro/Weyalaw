import 'dart:math';

class LocationUtil {
  /// Calculates the distance between two geographical coordinates in kilometers
  /// using the Haversine formula.
  ///
  /// [lat1] - Latitude of the first point in degrees
  /// [lon1] - Longitude of the first point in degrees
  /// [lat2] - Latitude of the second point in degrees
  /// [lon2] - Longitude of the second point in degrees
  ///
  /// Returns the distance in kilometers
  static double getRadiusBetween(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // Earth's radius in kilometers

    // Convert degrees to radians
    final double lat1Rad = _degreesToRadians(lat1);
    final double lon1Rad = _degreesToRadians(lon1);
    final double lat2Rad = _degreesToRadians(lat2);
    final double lon2Rad = _degreesToRadians(lon2);

    // Differences in coordinates
    final double dLat = lat2Rad - lat1Rad;
    final double dLon = lon2Rad - lon1Rad;

    // Haversine formula
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Calculate distance
    return earthRadius * c;
  }

  /// Converts degrees to radians
  static double _degreesToRadians(double degrees) {
    return degrees * (pi / 180.0);
  }
}
