import 'package:freezed_annotation/freezed_annotation.dart';

part 'reverse_geocoding_response.freezed.dart';
part 'reverse_geocoding_response.g.dart';

@freezed
class ReverseGeocoding with _$ReverseGeocoding {
  const factory ReverseGeocoding({
    required String? name,
    required double? latitude,
    required double? longitude,
    @JsonKey(name: 'Country') required String? country,
    @JsonKey(name: 'City') required String? city,
    required String type,
    required double? duration,
    required double? distance,
  }) = _ReverseGeocoding;

  factory ReverseGeocoding.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodingFromJson(json);
}
