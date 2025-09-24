// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_layer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapLayerDto {

 String get name; String get description; String get layerCode; bool get isEnabled;
/// Create a copy of MapLayerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapLayerDtoCopyWith<MapLayerDto> get copyWith => _$MapLayerDtoCopyWithImpl<MapLayerDto>(this as MapLayerDto, _$identity);

  /// Serializes this MapLayerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapLayerDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.layerCode, layerCode) || other.layerCode == layerCode)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,layerCode,isEnabled);

@override
String toString() {
  return 'MapLayerDto(name: $name, description: $description, layerCode: $layerCode, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $MapLayerDtoCopyWith<$Res>  {
  factory $MapLayerDtoCopyWith(MapLayerDto value, $Res Function(MapLayerDto) _then) = _$MapLayerDtoCopyWithImpl;
@useResult
$Res call({
 String name, String description, String layerCode, bool isEnabled
});




}
/// @nodoc
class _$MapLayerDtoCopyWithImpl<$Res>
    implements $MapLayerDtoCopyWith<$Res> {
  _$MapLayerDtoCopyWithImpl(this._self, this._then);

  final MapLayerDto _self;
  final $Res Function(MapLayerDto) _then;

/// Create a copy of MapLayerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? layerCode = null,Object? isEnabled = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,layerCode: null == layerCode ? _self.layerCode : layerCode // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MapLayerDto].
extension MapLayerDtoPatterns on MapLayerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapLayerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapLayerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapLayerDto value)  $default,){
final _that = this;
switch (_that) {
case _MapLayerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapLayerDto value)?  $default,){
final _that = this;
switch (_that) {
case _MapLayerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  String layerCode,  bool isEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapLayerDto() when $default != null:
return $default(_that.name,_that.description,_that.layerCode,_that.isEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  String layerCode,  bool isEnabled)  $default,) {final _that = this;
switch (_that) {
case _MapLayerDto():
return $default(_that.name,_that.description,_that.layerCode,_that.isEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  String layerCode,  bool isEnabled)?  $default,) {final _that = this;
switch (_that) {
case _MapLayerDto() when $default != null:
return $default(_that.name,_that.description,_that.layerCode,_that.isEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapLayerDto implements MapLayerDto {
  const _MapLayerDto({this.name = '', this.description = '', this.layerCode = '', this.isEnabled = true});
  factory _MapLayerDto.fromJson(Map<String, dynamic> json) => _$MapLayerDtoFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  String layerCode;
@override@JsonKey() final  bool isEnabled;

/// Create a copy of MapLayerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapLayerDtoCopyWith<_MapLayerDto> get copyWith => __$MapLayerDtoCopyWithImpl<_MapLayerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapLayerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapLayerDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.layerCode, layerCode) || other.layerCode == layerCode)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,layerCode,isEnabled);

@override
String toString() {
  return 'MapLayerDto(name: $name, description: $description, layerCode: $layerCode, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class _$MapLayerDtoCopyWith<$Res> implements $MapLayerDtoCopyWith<$Res> {
  factory _$MapLayerDtoCopyWith(_MapLayerDto value, $Res Function(_MapLayerDto) _then) = __$MapLayerDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, String layerCode, bool isEnabled
});




}
/// @nodoc
class __$MapLayerDtoCopyWithImpl<$Res>
    implements _$MapLayerDtoCopyWith<$Res> {
  __$MapLayerDtoCopyWithImpl(this._self, this._then);

  final _MapLayerDto _self;
  final $Res Function(_MapLayerDto) _then;

/// Create a copy of MapLayerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? layerCode = null,Object? isEnabled = null,}) {
  return _then(_MapLayerDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,layerCode: null == layerCode ? _self.layerCode : layerCode // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
