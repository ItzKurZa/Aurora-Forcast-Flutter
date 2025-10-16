// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sun_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SunDto {

 String get label; String get imageUrl; int get wavelength;
/// Create a copy of SunDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SunDtoCopyWith<SunDto> get copyWith => _$SunDtoCopyWithImpl<SunDto>(this as SunDto, _$identity);

  /// Serializes this SunDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SunDto&&(identical(other.label, label) || other.label == label)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.wavelength, wavelength) || other.wavelength == wavelength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,imageUrl,wavelength);

@override
String toString() {
  return 'SunDto(label: $label, imageUrl: $imageUrl, wavelength: $wavelength)';
}


}

/// @nodoc
abstract mixin class $SunDtoCopyWith<$Res>  {
  factory $SunDtoCopyWith(SunDto value, $Res Function(SunDto) _then) = _$SunDtoCopyWithImpl;
@useResult
$Res call({
 String label, String imageUrl, int wavelength
});




}
/// @nodoc
class _$SunDtoCopyWithImpl<$Res>
    implements $SunDtoCopyWith<$Res> {
  _$SunDtoCopyWithImpl(this._self, this._then);

  final SunDto _self;
  final $Res Function(SunDto) _then;

/// Create a copy of SunDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? imageUrl = null,Object? wavelength = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,wavelength: null == wavelength ? _self.wavelength : wavelength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SunDto].
extension SunDtoPatterns on SunDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SunDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SunDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SunDto value)  $default,){
final _that = this;
switch (_that) {
case _SunDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SunDto value)?  $default,){
final _that = this;
switch (_that) {
case _SunDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String imageUrl,  int wavelength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SunDto() when $default != null:
return $default(_that.label,_that.imageUrl,_that.wavelength);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String imageUrl,  int wavelength)  $default,) {final _that = this;
switch (_that) {
case _SunDto():
return $default(_that.label,_that.imageUrl,_that.wavelength);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String imageUrl,  int wavelength)?  $default,) {final _that = this;
switch (_that) {
case _SunDto() when $default != null:
return $default(_that.label,_that.imageUrl,_that.wavelength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SunDto implements SunDto {
  const _SunDto({required this.label, required this.imageUrl, required this.wavelength});
  factory _SunDto.fromJson(Map<String, dynamic> json) => _$SunDtoFromJson(json);

@override final  String label;
@override final  String imageUrl;
@override final  int wavelength;

/// Create a copy of SunDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SunDtoCopyWith<_SunDto> get copyWith => __$SunDtoCopyWithImpl<_SunDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SunDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SunDto&&(identical(other.label, label) || other.label == label)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.wavelength, wavelength) || other.wavelength == wavelength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,imageUrl,wavelength);

@override
String toString() {
  return 'SunDto(label: $label, imageUrl: $imageUrl, wavelength: $wavelength)';
}


}

/// @nodoc
abstract mixin class _$SunDtoCopyWith<$Res> implements $SunDtoCopyWith<$Res> {
  factory _$SunDtoCopyWith(_SunDto value, $Res Function(_SunDto) _then) = __$SunDtoCopyWithImpl;
@override @useResult
$Res call({
 String label, String imageUrl, int wavelength
});




}
/// @nodoc
class __$SunDtoCopyWithImpl<$Res>
    implements _$SunDtoCopyWith<$Res> {
  __$SunDtoCopyWithImpl(this._self, this._then);

  final _SunDto _self;
  final $Res Function(_SunDto) _then;

/// Create a copy of SunDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? imageUrl = null,Object? wavelength = null,}) {
  return _then(_SunDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,wavelength: null == wavelength ? _self.wavelength : wavelength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
