// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_coding_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeoCoding _$GeoCodingFromJson(Map<String, dynamic> json) {
  return _GeoCoding.fromJson(json);
}

/// @nodoc
mixin _$GeoCoding {
  num? get latitude => throw _privateConstructorUsedError;
  num? get longitude => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this GeoCoding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeoCoding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoCodingCopyWith<GeoCoding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoCodingCopyWith<$Res> {
  factory $GeoCodingCopyWith(GeoCoding value, $Res Function(GeoCoding) then) =
      _$GeoCodingCopyWithImpl<$Res, GeoCoding>;
  @useResult
  $Res call(
      {num? latitude,
      num? longitude,
      String? name,
      String? city,
      String? country,
      String? type});
}

/// @nodoc
class _$GeoCodingCopyWithImpl<$Res, $Val extends GeoCoding>
    implements $GeoCodingCopyWith<$Res> {
  _$GeoCodingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoCoding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? name = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoCodingImplCopyWith<$Res>
    implements $GeoCodingCopyWith<$Res> {
  factory _$$GeoCodingImplCopyWith(
          _$GeoCodingImpl value, $Res Function(_$GeoCodingImpl) then) =
      __$$GeoCodingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? latitude,
      num? longitude,
      String? name,
      String? city,
      String? country,
      String? type});
}

/// @nodoc
class __$$GeoCodingImplCopyWithImpl<$Res>
    extends _$GeoCodingCopyWithImpl<$Res, _$GeoCodingImpl>
    implements _$$GeoCodingImplCopyWith<$Res> {
  __$$GeoCodingImplCopyWithImpl(
      _$GeoCodingImpl _value, $Res Function(_$GeoCodingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeoCoding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? name = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? type = freezed,
  }) {
    return _then(_$GeoCodingImpl(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoCodingImpl implements _GeoCoding {
  const _$GeoCodingImpl(
      {required this.latitude,
      required this.longitude,
      required this.name,
      required this.city,
      required this.country,
      required this.type});

  factory _$GeoCodingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoCodingImplFromJson(json);

  @override
  final num? latitude;
  @override
  final num? longitude;
  @override
  final String? name;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? type;

  @override
  String toString() {
    return 'GeoCoding(latitude: $latitude, longitude: $longitude, name: $name, city: $city, country: $country, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoCodingImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, name, city, country, type);

  /// Create a copy of GeoCoding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoCodingImplCopyWith<_$GeoCodingImpl> get copyWith =>
      __$$GeoCodingImplCopyWithImpl<_$GeoCodingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoCodingImplToJson(
      this,
    );
  }
}

abstract class _GeoCoding implements GeoCoding {
  const factory _GeoCoding(
      {required final num? latitude,
      required final num? longitude,
      required final String? name,
      required final String? city,
      required final String? country,
      required final String? type}) = _$GeoCodingImpl;

  factory _GeoCoding.fromJson(Map<String, dynamic> json) =
      _$GeoCodingImpl.fromJson;

  @override
  num? get latitude;
  @override
  num? get longitude;
  @override
  String? get name;
  @override
  String? get city;
  @override
  String? get country;
  @override
  String? get type;

  /// Create a copy of GeoCoding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoCodingImplCopyWith<_$GeoCodingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
