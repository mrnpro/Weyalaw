// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_coding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoCodingImpl _$$GeoCodingImplFromJson(Map<String, dynamic> json) =>
    _$GeoCodingImpl(
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$GeoCodingImplToJson(_$GeoCodingImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'type': instance.type,
    };
