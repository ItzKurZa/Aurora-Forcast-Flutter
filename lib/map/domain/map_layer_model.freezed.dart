// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_layer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapLayerModel {

 MapLayerType get type; String get name; String get description; String get layerCode; bool get isEnabled;
/// Create a copy of MapLayerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapLayerModelCopyWith<MapLayerModel> get copyWith => _$MapLayerModelCopyWithImpl<MapLayerModel>(this as MapLayerModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapLayerModel&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.layerCode, layerCode) || other.layerCode == layerCode)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,type,name,description,layerCode,isEnabled);

@override
String toString() {
  return 'MapLayerModel(type: $type, name: $name, description: $description, layerCode: $layerCode, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $MapLayerModelCopyWith<$Res>  {
  factory $MapLayerModelCopyWith(MapLayerModel value, $Res Function(MapLayerModel) _then) = _$MapLayerModelCopyWithImpl;
@useResult
$Res call({
 MapLayerType type, String name, String description, String layerCode, bool isEnabled
});




}
/// @nodoc
class _$MapLayerModelCopyWithImpl<$Res>
    implements $MapLayerModelCopyWith<$Res> {
  _$MapLayerModelCopyWithImpl(this._self, this._then);

  final MapLayerModel _self;
  final $Res Function(MapLayerModel) _then;

/// Create a copy of MapLayerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,Object? description = null,Object? layerCode = null,Object? isEnabled = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapLayerType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,layerCode: null == layerCode ? _self.layerCode : layerCode // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MapLayerModel].
extension MapLayerModelPatterns on MapLayerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapLayerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapLayerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapLayerModel value)  $default,){
final _that = this;
switch (_that) {
case _MapLayerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapLayerModel value)?  $default,){
final _that = this;
switch (_that) {
case _MapLayerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapLayerType type,  String name,  String description,  String layerCode,  bool isEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapLayerModel() when $default != null:
return $default(_that.type,_that.name,_that.description,_that.layerCode,_that.isEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapLayerType type,  String name,  String description,  String layerCode,  bool isEnabled)  $default,) {final _that = this;
switch (_that) {
case _MapLayerModel():
return $default(_that.type,_that.name,_that.description,_that.layerCode,_that.isEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapLayerType type,  String name,  String description,  String layerCode,  bool isEnabled)?  $default,) {final _that = this;
switch (_that) {
case _MapLayerModel() when $default != null:
return $default(_that.type,_that.name,_that.description,_that.layerCode,_that.isEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _MapLayerModel implements MapLayerModel {
  const _MapLayerModel({this.type = MapLayerType.normal, this.name = '', this.description = '', this.layerCode = '', this.isEnabled = true});
  

@override@JsonKey() final  MapLayerType type;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  String layerCode;
@override@JsonKey() final  bool isEnabled;

/// Create a copy of MapLayerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapLayerModelCopyWith<_MapLayerModel> get copyWith => __$MapLayerModelCopyWithImpl<_MapLayerModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapLayerModel&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.layerCode, layerCode) || other.layerCode == layerCode)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,type,name,description,layerCode,isEnabled);

@override
String toString() {
  return 'MapLayerModel(type: $type, name: $name, description: $description, layerCode: $layerCode, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class _$MapLayerModelCopyWith<$Res> implements $MapLayerModelCopyWith<$Res> {
  factory _$MapLayerModelCopyWith(_MapLayerModel value, $Res Function(_MapLayerModel) _then) = __$MapLayerModelCopyWithImpl;
@override @useResult
$Res call({
 MapLayerType type, String name, String description, String layerCode, bool isEnabled
});




}
/// @nodoc
class __$MapLayerModelCopyWithImpl<$Res>
    implements _$MapLayerModelCopyWith<$Res> {
  __$MapLayerModelCopyWithImpl(this._self, this._then);

  final _MapLayerModel _self;
  final $Res Function(_MapLayerModel) _then;

/// Create a copy of MapLayerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? description = null,Object? layerCode = null,Object? isEnabled = null,}) {
  return _then(_MapLayerModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapLayerType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,layerCode: null == layerCode ? _self.layerCode : layerCode // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
