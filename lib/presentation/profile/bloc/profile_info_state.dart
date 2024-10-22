import 'package:spotify_clone/domain/entities/auth/user.dart';

class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity userEntity;

  ProfileInfoLoaded({
    required this.userEntity,
  });
}

class ProfileInfoLoadFailure extends ProfileInfoState {}
