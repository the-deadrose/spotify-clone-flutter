import 'package:spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageUrl;

  UserModel({
    this.fullName,
    this.email,
    this.imageUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
  }
}

extension UserModelExtension on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      email: email,
      imageUrl: imageUrl,
    );
  }
}
