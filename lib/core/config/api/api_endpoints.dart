class APIEndpoints {
  static const String baseUrl = "https://go-find-taxi-backend.onrender.com";
  static const String redatBaseUrl = "https://redat-backend-production.up.railway.app";

  // Redat endpoints
  static const String redatRouteMap = "/route-map";

  // Main app endpoints
  static const String transportOptions = "/api/transport-options";

  static const String directions = "/api/location/directions";
  static const String geocode = "/api/location/geocode";
  static const String reverseGeocode = "/api/location/reverse-geocode";
  static const String placeName = "/api/location/place-name";
}
