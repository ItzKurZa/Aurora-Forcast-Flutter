// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlertState {

 List<AlertModel> get alerts; bool get isAlertsLoading; bool get hasAlertsError; bool get globalAlertsEnabled; bool get isGlobalAlertsLoading; bool get hasGlobalAlertsError;
/// Create a copy of AlertState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertStateCopyWith<AlertState> get copyWith => _$AlertStateCopyWithImpl<AlertState>(this as AlertState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertState&&const DeepCollectionEquality().equals(other.alerts, alerts)&&(identical(other.isAlertsLoading, isAlertsLoading) || other.isAlertsLoading == isAlertsLoading)&&(identical(other.hasAlertsError, hasAlertsError) || other.hasAlertsError == hasAlertsError)&&(identical(other.globalAlertsEnabled, globalAlertsEnabled) || other.globalAlertsEnabled == globalAlertsEnabled)&&(identical(other.isGlobalAlertsLoading, isGlobalAlertsLoading) || other.isGlobalAlertsLoading == isGlobalAlertsLoading)&&(identical(other.hasGlobalAlertsError, hasGlobalAlertsError) || other.hasGlobalAlertsError == hasGlobalAlertsError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(alerts),isAlertsLoading,hasAlertsError,globalAlertsEnabled,isGlobalAlertsLoading,hasGlobalAlertsError);

@override
String toString() {
  return 'AlertState(alerts: $alerts, isAlertsLoading: $isAlertsLoading, hasAlertsError: $hasAlertsError, globalAlertsEnabled: $globalAlertsEnabled, isGlobalAlertsLoading: $isGlobalAlertsLoading, hasGlobalAlertsError: $hasGlobalAlertsError)';
}


}

/// @nodoc
abstract mixin class $AlertStateCopyWith<$Res>  {
  factory $AlertStateCopyWith(AlertState value, $Res Function(AlertState) _then) = _$AlertStateCopyWithImpl;
@useResult
$Res call({
 List<AlertModel> alerts, bool isAlertsLoading, bool hasAlertsError, bool globalAlertsEnabled, bool isGlobalAlertsLoading, bool hasGlobalAlertsError
});




}
/// @nodoc
class _$AlertStateCopyWithImpl<$Res>
    implements $AlertStateCopyWith<$Res> {
  _$AlertStateCopyWithImpl(this._self, this._then);

  final AlertState _self;
  final $Res Function(AlertState) _then;

/// Create a copy of AlertState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alerts = null,Object? isAlertsLoading = null,Object? hasAlertsError = null,Object? globalAlertsEnabled = null,Object? isGlobalAlertsLoading = null,Object? hasGlobalAlertsError = null,}) {
  return _then(_self.copyWith(
alerts: null == alerts ? _self.alerts : alerts // ignore: cast_nullable_to_non_nullable
as List<AlertModel>,isAlertsLoading: null == isAlertsLoading ? _self.isAlertsLoading : isAlertsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasAlertsError: null == hasAlertsError ? _self.hasAlertsError : hasAlertsError // ignore: cast_nullable_to_non_nullable
as bool,globalAlertsEnabled: null == globalAlertsEnabled ? _self.globalAlertsEnabled : globalAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,isGlobalAlertsLoading: null == isGlobalAlertsLoading ? _self.isGlobalAlertsLoading : isGlobalAlertsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasGlobalAlertsError: null == hasGlobalAlertsError ? _self.hasGlobalAlertsError : hasGlobalAlertsError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertState].
extension AlertStatePatterns on AlertState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertState value)  $default,){
final _that = this;
switch (_that) {
case _AlertState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertState value)?  $default,){
final _that = this;
switch (_that) {
case _AlertState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AlertModel> alerts,  bool isAlertsLoading,  bool hasAlertsError,  bool globalAlertsEnabled,  bool isGlobalAlertsLoading,  bool hasGlobalAlertsError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertState() when $default != null:
return $default(_that.alerts,_that.isAlertsLoading,_that.hasAlertsError,_that.globalAlertsEnabled,_that.isGlobalAlertsLoading,_that.hasGlobalAlertsError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AlertModel> alerts,  bool isAlertsLoading,  bool hasAlertsError,  bool globalAlertsEnabled,  bool isGlobalAlertsLoading,  bool hasGlobalAlertsError)  $default,) {final _that = this;
switch (_that) {
case _AlertState():
return $default(_that.alerts,_that.isAlertsLoading,_that.hasAlertsError,_that.globalAlertsEnabled,_that.isGlobalAlertsLoading,_that.hasGlobalAlertsError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AlertModel> alerts,  bool isAlertsLoading,  bool hasAlertsError,  bool globalAlertsEnabled,  bool isGlobalAlertsLoading,  bool hasGlobalAlertsError)?  $default,) {final _that = this;
switch (_that) {
case _AlertState() when $default != null:
return $default(_that.alerts,_that.isAlertsLoading,_that.hasAlertsError,_that.globalAlertsEnabled,_that.isGlobalAlertsLoading,_that.hasGlobalAlertsError);case _:
  return null;

}
}

}

/// @nodoc


class _AlertState extends AlertState {
  const _AlertState({final  List<AlertModel> alerts = const [], this.isAlertsLoading = false, this.hasAlertsError = false, this.globalAlertsEnabled = false, this.isGlobalAlertsLoading = false, this.hasGlobalAlertsError = false}): _alerts = alerts,super._();
  

 final  List<AlertModel> _alerts;
@override@JsonKey() List<AlertModel> get alerts {
  if (_alerts is EqualUnmodifiableListView) return _alerts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alerts);
}

@override@JsonKey() final  bool isAlertsLoading;
@override@JsonKey() final  bool hasAlertsError;
@override@JsonKey() final  bool globalAlertsEnabled;
@override@JsonKey() final  bool isGlobalAlertsLoading;
@override@JsonKey() final  bool hasGlobalAlertsError;

/// Create a copy of AlertState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertStateCopyWith<_AlertState> get copyWith => __$AlertStateCopyWithImpl<_AlertState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertState&&const DeepCollectionEquality().equals(other._alerts, _alerts)&&(identical(other.isAlertsLoading, isAlertsLoading) || other.isAlertsLoading == isAlertsLoading)&&(identical(other.hasAlertsError, hasAlertsError) || other.hasAlertsError == hasAlertsError)&&(identical(other.globalAlertsEnabled, globalAlertsEnabled) || other.globalAlertsEnabled == globalAlertsEnabled)&&(identical(other.isGlobalAlertsLoading, isGlobalAlertsLoading) || other.isGlobalAlertsLoading == isGlobalAlertsLoading)&&(identical(other.hasGlobalAlertsError, hasGlobalAlertsError) || other.hasGlobalAlertsError == hasGlobalAlertsError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_alerts),isAlertsLoading,hasAlertsError,globalAlertsEnabled,isGlobalAlertsLoading,hasGlobalAlertsError);

@override
String toString() {
  return 'AlertState(alerts: $alerts, isAlertsLoading: $isAlertsLoading, hasAlertsError: $hasAlertsError, globalAlertsEnabled: $globalAlertsEnabled, isGlobalAlertsLoading: $isGlobalAlertsLoading, hasGlobalAlertsError: $hasGlobalAlertsError)';
}


}

/// @nodoc
abstract mixin class _$AlertStateCopyWith<$Res> implements $AlertStateCopyWith<$Res> {
  factory _$AlertStateCopyWith(_AlertState value, $Res Function(_AlertState) _then) = __$AlertStateCopyWithImpl;
@override @useResult
$Res call({
 List<AlertModel> alerts, bool isAlertsLoading, bool hasAlertsError, bool globalAlertsEnabled, bool isGlobalAlertsLoading, bool hasGlobalAlertsError
});




}
/// @nodoc
class __$AlertStateCopyWithImpl<$Res>
    implements _$AlertStateCopyWith<$Res> {
  __$AlertStateCopyWithImpl(this._self, this._then);

  final _AlertState _self;
  final $Res Function(_AlertState) _then;

/// Create a copy of AlertState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alerts = null,Object? isAlertsLoading = null,Object? hasAlertsError = null,Object? globalAlertsEnabled = null,Object? isGlobalAlertsLoading = null,Object? hasGlobalAlertsError = null,}) {
  return _then(_AlertState(
alerts: null == alerts ? _self._alerts : alerts // ignore: cast_nullable_to_non_nullable
as List<AlertModel>,isAlertsLoading: null == isAlertsLoading ? _self.isAlertsLoading : isAlertsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasAlertsError: null == hasAlertsError ? _self.hasAlertsError : hasAlertsError // ignore: cast_nullable_to_non_nullable
as bool,globalAlertsEnabled: null == globalAlertsEnabled ? _self.globalAlertsEnabled : globalAlertsEnabled // ignore: cast_nullable_to_non_nullable
as bool,isGlobalAlertsLoading: null == isGlobalAlertsLoading ? _self.isGlobalAlertsLoading : isGlobalAlertsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasGlobalAlertsError: null == hasGlobalAlertsError ? _self.hasGlobalAlertsError : hasGlobalAlertsError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
