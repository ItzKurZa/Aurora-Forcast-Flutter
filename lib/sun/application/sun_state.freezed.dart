// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sun_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SunState {

 List<SunModel> get images; bool get isLoading; bool get hasError;
/// Create a copy of SunState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SunStateCopyWith<SunState> get copyWith => _$SunStateCopyWithImpl<SunState>(this as SunState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SunState&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images),isLoading,hasError);

@override
String toString() {
  return 'SunState(images: $images, isLoading: $isLoading, hasError: $hasError)';
}


}

/// @nodoc
abstract mixin class $SunStateCopyWith<$Res>  {
  factory $SunStateCopyWith(SunState value, $Res Function(SunState) _then) = _$SunStateCopyWithImpl;
@useResult
$Res call({
 List<SunModel> images, bool isLoading, bool hasError
});




}
/// @nodoc
class _$SunStateCopyWithImpl<$Res>
    implements $SunStateCopyWith<$Res> {
  _$SunStateCopyWithImpl(this._self, this._then);

  final SunState _self;
  final $Res Function(SunState) _then;

/// Create a copy of SunState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = null,Object? isLoading = null,Object? hasError = null,}) {
  return _then(_self.copyWith(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<SunModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SunState].
extension SunStatePatterns on SunState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SunState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SunState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SunState value)  $default,){
final _that = this;
switch (_that) {
case _SunState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SunState value)?  $default,){
final _that = this;
switch (_that) {
case _SunState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SunModel> images,  bool isLoading,  bool hasError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SunState() when $default != null:
return $default(_that.images,_that.isLoading,_that.hasError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SunModel> images,  bool isLoading,  bool hasError)  $default,) {final _that = this;
switch (_that) {
case _SunState():
return $default(_that.images,_that.isLoading,_that.hasError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SunModel> images,  bool isLoading,  bool hasError)?  $default,) {final _that = this;
switch (_that) {
case _SunState() when $default != null:
return $default(_that.images,_that.isLoading,_that.hasError);case _:
  return null;

}
}

}

/// @nodoc


class _SunState extends SunState {
  const _SunState({final  List<SunModel> images = const [], this.isLoading = false, this.hasError = false}): _images = images,super._();
  

 final  List<SunModel> _images;
@override@JsonKey() List<SunModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasError;

/// Create a copy of SunState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SunStateCopyWith<_SunState> get copyWith => __$SunStateCopyWithImpl<_SunState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SunState&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images),isLoading,hasError);

@override
String toString() {
  return 'SunState(images: $images, isLoading: $isLoading, hasError: $hasError)';
}


}

/// @nodoc
abstract mixin class _$SunStateCopyWith<$Res> implements $SunStateCopyWith<$Res> {
  factory _$SunStateCopyWith(_SunState value, $Res Function(_SunState) _then) = __$SunStateCopyWithImpl;
@override @useResult
$Res call({
 List<SunModel> images, bool isLoading, bool hasError
});




}
/// @nodoc
class __$SunStateCopyWithImpl<$Res>
    implements _$SunStateCopyWith<$Res> {
  __$SunStateCopyWithImpl(this._self, this._then);

  final _SunState _self;
  final $Res Function(_SunState) _then;

/// Create a copy of SunState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,Object? isLoading = null,Object? hasError = null,}) {
  return _then(_SunState(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<SunModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
