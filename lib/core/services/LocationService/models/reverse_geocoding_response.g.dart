// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_geocoding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReverseGeocodingImpl _$$ReverseGeocodingImplFromJson(
        Map<String, dynamic> json) =>
    _$ReverseGeocodingImpl(
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      country: json['Country'] as String?,
      city: json['City'] as String?,
      type: json['type'] as String,
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ReverseGeocodingImplToJson(
        _$ReverseGeocodingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'Country': instance.country,
      'City': instance.city,
      'type': instance.type,
      'duration': instance.duration,
      'distance': instance.distance,
    };
