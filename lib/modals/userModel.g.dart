// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      email: json['email'] as String?,
      password: json['password'] as String?,
      profileImage: json['profileImage'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'profileImage': instance.profileImage,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'isAdmin': instance.isAdmin,
    };
