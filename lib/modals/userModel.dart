import 'package:freezed_annotation/freezed_annotation.dart';

part 'userModel.freezed.dart';
// part 'userModel.g.dart';  // Uncomment this if you want to generate toJson/fromJson methods

//freezed package that helps you to create modals without extra mess like copy with method tojson, fromjson and blah blah
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    String? email,
    String? password,
    String? profileImage,
    @Default(false) bool isAdmin,
  }) = _UserModel;


  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
//got successss finally.....yeahhhh