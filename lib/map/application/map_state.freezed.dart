// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {

 List<MapLayerModel> get availableLayers; MapLayerType get selectedLayerType; bool get isLoading; bool get hasError; String get errorMessage; String get apiKey; bool get isApiKeyValid;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&const DeepCollectionEquality().equals(other.availableLayers, availableLayers)&&(identical(other.selectedLayerType, selectedLayerType) || other.selectedLayerType == selectedLayerType)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.isApiKeyValid, isApiKeyValid) || other.isApiKeyValid == isApiKeyValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableLayers),selectedLayerType,isLoading,hasError,errorMessage,apiKey,isApiKeyValid);

@override
String toString() {
  return 'MapState(availableLayers: $availableLayers, selectedLayerType: $selectedLayerType, isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, apiKey: $apiKey, isApiKeyValid: $isApiKeyValid)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 List<MapLayerModel> availableLayers, MapLayerType selectedLayerType, bool isLoading, bool hasError, String errorMessage, String apiKey, bool isApiKeyValid
});




}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableLayers = null,Object? selectedLayerType = null,Object? isLoading = null,Object? hasError = null,Object? errorMessage = null,Object? apiKey = null,Object? isApiKeyValid = null,}) {
  return _then(_self.copyWith(
availableLayers: null == availableLayers ? _self.availableLayers : availableLayers // ignore: cast_nullable_to_non_nullable
as List<MapLayerModel>,selectedLayerType: null == selectedLayerType ? _self.selectedLayerType : selectedLayerType // ignore: cast_nullable_to_non_nullable
as MapLayerType,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,isApiKeyValid: null == isApiKeyValid ? _self.isApiKeyValid : isApiKeyValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapState value)  $default,){
final _that = this;
switch (_that) {
case _MapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapState value)?  $default,){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MapLayerModel> availableLayers,  MapLayerType selectedLayerType,  bool isLoading,  bool hasError,  String errorMessage,  String apiKey,  bool isApiKeyValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.availableLayers,_that.selectedLayerType,_that.isLoading,_that.hasError,_that.errorMessage,_that.apiKey,_that.isApiKeyValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MapLayerModel> availableLayers,  MapLayerType selectedLayerType,  bool isLoading,  bool hasError,  String errorMessage,  String apiKey,  bool isApiKeyValid)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.availableLayers,_that.selectedLayerType,_that.isLoading,_that.hasError,_that.errorMessage,_that.apiKey,_that.isApiKeyValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MapLayerModel> availableLayers,  MapLayerType selectedLayerType,  bool isLoading,  bool hasError,  String errorMessage,  String apiKey,  bool isApiKeyValid)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.availableLayers,_that.selectedLayerType,_that.isLoading,_that.hasError,_that.errorMessage,_that.apiKey,_that.isApiKeyValid);case _:
  return null;

}
}

}

/// @nodoc


class _MapState implements MapState {
  const _MapState({final  List<MapLayerModel> availableLayers = const [], this.selectedLayerType = MapLayerType.normal, this.isLoading = false, this.hasError = false, this.errorMessage = '', this.apiKey = '', this.isApiKeyValid = false}): _availableLayers = availableLayers;
  

 final  List<MapLayerModel> _availableLayers;
@override@JsonKey() List<MapLayerModel> get availableLayers {
  if (_availableLayers is EqualUnmodifiableListView) return _availableLayers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableLayers);
}

@override@JsonKey() final  MapLayerType selectedLayerType;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasError;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  String apiKey;
@override@JsonKey() final  bool isApiKeyValid;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&const DeepCollectionEquality().equals(other._availableLayers, _availableLayers)&&(identical(other.selectedLayerType, selectedLayerType) || other.selectedLayerType == selectedLayerType)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.isApiKeyValid, isApiKeyValid) || other.isApiKeyValid == isApiKeyValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableLayers),selectedLayerType,isLoading,hasError,errorMessage,apiKey,isApiKeyValid);

@override
String toString() {
  return 'MapState(availableLayers: $availableLayers, selectedLayerType: $selectedLayerType, isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, apiKey: $apiKey, isApiKeyValid: $isApiKeyValid)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 List<MapLayerModel> availableLayers, MapLayerType selectedLayerType, bool isLoading, bool hasError, String errorMessage, String apiKey, bool isApiKeyValid
});




}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableLayers = null,Object? selectedLayerType = null,Object? isLoading = null,Object? hasError = null,Object? errorMessage = null,Object? apiKey = null,Object? isApiKeyValid = null,}) {
  return _then(_MapState(
availableLayers: null == availableLayers ? _self._availableLayers : availableLayers // ignore: cast_nullable_to_non_nullable
as List<MapLayerModel>,selectedLayerType: null == selectedLayerType ? _self.selectedLayerType : selectedLayerType // ignore: cast_nullable_to_non_nullable
as MapLayerType,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,isApiKeyValid: null == isApiKeyValid ? _self.isApiKeyValid : isApiKeyValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
