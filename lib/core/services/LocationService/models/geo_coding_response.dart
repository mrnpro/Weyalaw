import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_coding_response.freezed.dart';
part 'geo_coding_response.g.dart';

@freezed
class GeoCoding with _$GeoCoding {
  const factory GeoCoding({
    required num? latitude,
    required num? longitude,
    required String? name,
    required String? city,
    required String? country,
    required String? type,
  }) = _GeoCoding;

  factory GeoCoding.fromJson(Map<String, dynamic> json) =>
      _$GeoCodingFromJson(json);
}
