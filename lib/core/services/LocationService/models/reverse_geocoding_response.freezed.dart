// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reverse_geocoding_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReverseGeocoding _$ReverseGeocodingFromJson(Map<String, dynamic> json) {
  return _ReverseGeocoding.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocoding {
  String? get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'City')
  String? get city => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  /// Serializes this ReverseGeocoding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReverseGeocoding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReverseGeocodingCopyWith<ReverseGeocoding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodingCopyWith<$Res> {
  factory $ReverseGeocodingCopyWith(
          ReverseGeocoding value, $Res Function(ReverseGeocoding) then) =
      _$ReverseGeocodingCopyWithImpl<$Res, ReverseGeocoding>;
  @useResult
  $Res call(
      {String? name,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'Country') String? country,
      @JsonKey(name: 'City') String? city,
      String type,
      double? duration,
      double? distance});
}

/// @nodoc
class _$ReverseGeocodingCopyWithImpl<$Res, $Val extends ReverseGeocoding>
    implements $ReverseGeocodingCopyWith<$Res> {
  _$ReverseGeocodingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReverseGeocoding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? type = null,
    Object? duration = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReverseGeocodingImplCopyWith<$Res>
    implements $ReverseGeocodingCopyWith<$Res> {
  factory _$$ReverseGeocodingImplCopyWith(_$ReverseGeocodingImpl value,
          $Res Function(_$ReverseGeocodingImpl) then) =
      __$$ReverseGeocodingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'Country') String? country,
      @JsonKey(name: 'City') String? city,
      String type,
      double? duration,
      double? distance});
}

/// @nodoc
class __$$ReverseGeocodingImplCopyWithImpl<$Res>
    extends _$ReverseGeocodingCopyWithImpl<$Res, _$ReverseGeocodingImpl>
    implements _$$ReverseGeocodingImplCopyWith<$Res> {
  __$$ReverseGeocodingImplCopyWithImpl(_$ReverseGeocodingImpl _value,
      $Res Function(_$ReverseGeocodingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReverseGeocoding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? type = null,
    Object? duration = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$ReverseGeocodingImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseGeocodingImpl implements _ReverseGeocoding {
  const _$ReverseGeocodingImpl(
      {required this.name,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'Country') required this.country,
      @JsonKey(name: 'City') required this.city,
      required this.type,
      required this.duration,
      required this.distance});

  factory _$ReverseGeocodingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReverseGeocodingImplFromJson(json);

  @override
  final String? name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'Country')
  final String? country;
  @override
  @JsonKey(name: 'City')
  final String? city;
  @override
  final String type;
  @override
  final double? duration;
  @override
  final double? distance;

  @override
  String toString() {
    return 'ReverseGeocoding(name: $name, latitude: $latitude, longitude: $longitude, country: $country, city: $city, type: $type, duration: $duration, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeocodingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, latitude, longitude,
      country, city, type, duration, distance);

  /// Create a copy of ReverseGeocoding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeocodingImplCopyWith<_$ReverseGeocodingImpl> get copyWith =>
      __$$ReverseGeocodingImplCopyWithImpl<_$ReverseGeocodingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseGeocodingImplToJson(
      this,
    );
  }
}

abstract class _ReverseGeocoding implements ReverseGeocoding {
  const factory _ReverseGeocoding(
      {required final String? name,
      required final double? latitude,
      required final double? longitude,
      @JsonKey(name: 'Country') required final String? country,
      @JsonKey(name: 'City') required final String? city,
      required final String type,
      required final double? duration,
      required final double? distance}) = _$ReverseGeocodingImpl;

  factory _ReverseGeocoding.fromJson(Map<String, dynamic> json) =
      _$ReverseGeocodingImpl.fromJson;

  @override
  String? get name;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'Country')
  String? get country;
  @override
  @JsonKey(name: 'City')
  String? get city;
  @override
  String get type;
  @override
  double? get duration;
  @override
  double? get distance;

  /// Create a copy of ReverseGeocoding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseGeocodingImplCopyWith<_$ReverseGeocodingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
