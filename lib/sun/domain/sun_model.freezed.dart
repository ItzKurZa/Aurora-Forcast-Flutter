// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sun_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SunModel {

 String get label; String get imageUrl; int get wavelength;
/// Create a copy of SunModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SunModelCopyWith<SunModel> get copyWith => _$SunModelCopyWithImpl<SunModel>(this as SunModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SunModel&&(identical(other.label, label) || other.label == label)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.wavelength, wavelength) || other.wavelength == wavelength));
}


@override
int get hashCode => Object.hash(runtimeType,label,imageUrl,wavelength);

@override
String toString() {
  return 'SunModel(label: $label, imageUrl: $imageUrl, wavelength: $wavelength)';
}


}

/// @nodoc
abstract mixin class $SunModelCopyWith<$Res>  {
  factory $SunModelCopyWith(SunModel value, $Res Function(SunModel) _then) = _$SunModelCopyWithImpl;
@useResult
$Res call({
 String label, String imageUrl, int wavelength
});




}
/// @nodoc
class _$SunModelCopyWithImpl<$Res>
    implements $SunModelCopyWith<$Res> {
  _$SunModelCopyWithImpl(this._self, this._then);

  final SunModel _self;
  final $Res Function(SunModel) _then;

/// Create a copy of SunModel
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


/// Adds pattern-matching-related methods to [SunModel].
extension SunModelPatterns on SunModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SunModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SunModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SunModel value)  $default,){
final _that = this;
switch (_that) {
case _SunModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SunModel value)?  $default,){
final _that = this;
switch (_that) {
case _SunModel() when $default != null:
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
case _SunModel() when $default != null:
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
case _SunModel():
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
case _SunModel() when $default != null:
return $default(_that.label,_that.imageUrl,_that.wavelength);case _:
  return null;

}
}

}

/// @nodoc


class _SunModel implements SunModel {
  const _SunModel({this.label = '', this.imageUrl = '', this.wavelength = 0});
  

@override@JsonKey() final  String label;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  int wavelength;

/// Create a copy of SunModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SunModelCopyWith<_SunModel> get copyWith => __$SunModelCopyWithImpl<_SunModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SunModel&&(identical(other.label, label) || other.label == label)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.wavelength, wavelength) || other.wavelength == wavelength));
}


@override
int get hashCode => Object.hash(runtimeType,label,imageUrl,wavelength);

@override
String toString() {
  return 'SunModel(label: $label, imageUrl: $imageUrl, wavelength: $wavelength)';
}


}

/// @nodoc
abstract mixin class _$SunModelCopyWith<$Res> implements $SunModelCopyWith<$Res> {
  factory _$SunModelCopyWith(_SunModel value, $Res Function(_SunModel) _then) = __$SunModelCopyWithImpl;
@override @useResult
$Res call({
 String label, String imageUrl, int wavelength
});




}
/// @nodoc
class __$SunModelCopyWithImpl<$Res>
    implements _$SunModelCopyWith<$Res> {
  __$SunModelCopyWithImpl(this._self, this._then);

  final _SunModel _self;
  final $Res Function(_SunModel) _then;

/// Create a copy of SunModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? imageUrl = null,Object? wavelength = null,}) {
  return _then(_SunModel(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,wavelength: null == wavelength ? _self.wavelength : wavelength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
