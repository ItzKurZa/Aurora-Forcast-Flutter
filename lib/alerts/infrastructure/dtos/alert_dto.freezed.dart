// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertDto {

 String get id; String get title; String get message; bool get isEnabled; String get type; String get nasaUrl; String? get timestamp; String get status;
/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertDtoCopyWith<AlertDto> get copyWith => _$AlertDtoCopyWithImpl<AlertDto>(this as AlertDto, _$identity);

  /// Serializes this AlertDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.nasaUrl, nasaUrl) || other.nasaUrl == nasaUrl)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,isEnabled,type,nasaUrl,timestamp,status);

@override
String toString() {
  return 'AlertDto(id: $id, title: $title, message: $message, isEnabled: $isEnabled, type: $type, nasaUrl: $nasaUrl, timestamp: $timestamp, status: $status)';
}


}

/// @nodoc
abstract mixin class $AlertDtoCopyWith<$Res>  {
  factory $AlertDtoCopyWith(AlertDto value, $Res Function(AlertDto) _then) = _$AlertDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String message, bool isEnabled, String type, String nasaUrl, String? timestamp, String status
});




}
/// @nodoc
class _$AlertDtoCopyWithImpl<$Res>
    implements $AlertDtoCopyWith<$Res> {
  _$AlertDtoCopyWithImpl(this._self, this._then);

  final AlertDto _self;
  final $Res Function(AlertDto) _then;

/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? message = null,Object? isEnabled = null,Object? type = null,Object? nasaUrl = null,Object? timestamp = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,nasaUrl: null == nasaUrl ? _self.nasaUrl : nasaUrl // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertDto].
extension AlertDtoPatterns on AlertDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertDto value)  $default,){
final _that = this;
switch (_that) {
case _AlertDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertDto value)?  $default,){
final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String message,  bool isEnabled,  String type,  String nasaUrl,  String? timestamp,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.isEnabled,_that.type,_that.nasaUrl,_that.timestamp,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String message,  bool isEnabled,  String type,  String nasaUrl,  String? timestamp,  String status)  $default,) {final _that = this;
switch (_that) {
case _AlertDto():
return $default(_that.id,_that.title,_that.message,_that.isEnabled,_that.type,_that.nasaUrl,_that.timestamp,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String message,  bool isEnabled,  String type,  String nasaUrl,  String? timestamp,  String status)?  $default,) {final _that = this;
switch (_that) {
case _AlertDto() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.isEnabled,_that.type,_that.nasaUrl,_that.timestamp,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertDto implements AlertDto {
  const _AlertDto({this.id = '', this.title = '', this.message = '', this.isEnabled = false, this.type = 'aurora', this.nasaUrl = '', this.timestamp, this.status = 'unread'});
  factory _AlertDto.fromJson(Map<String, dynamic> json) => _$AlertDtoFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String message;
@override@JsonKey() final  bool isEnabled;
@override@JsonKey() final  String type;
@override@JsonKey() final  String nasaUrl;
@override final  String? timestamp;
@override@JsonKey() final  String status;

/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertDtoCopyWith<_AlertDto> get copyWith => __$AlertDtoCopyWithImpl<_AlertDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.type, type) || other.type == type)&&(identical(other.nasaUrl, nasaUrl) || other.nasaUrl == nasaUrl)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,isEnabled,type,nasaUrl,timestamp,status);

@override
String toString() {
  return 'AlertDto(id: $id, title: $title, message: $message, isEnabled: $isEnabled, type: $type, nasaUrl: $nasaUrl, timestamp: $timestamp, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AlertDtoCopyWith<$Res> implements $AlertDtoCopyWith<$Res> {
  factory _$AlertDtoCopyWith(_AlertDto value, $Res Function(_AlertDto) _then) = __$AlertDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String message, bool isEnabled, String type, String nasaUrl, String? timestamp, String status
});




}
/// @nodoc
class __$AlertDtoCopyWithImpl<$Res>
    implements _$AlertDtoCopyWith<$Res> {
  __$AlertDtoCopyWithImpl(this._self, this._then);

  final _AlertDto _self;
  final $Res Function(_AlertDto) _then;

/// Create a copy of AlertDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? message = null,Object? isEnabled = null,Object? type = null,Object? nasaUrl = null,Object? timestamp = freezed,Object? status = null,}) {
  return _then(_AlertDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,nasaUrl: null == nasaUrl ? _self.nasaUrl : nasaUrl // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
