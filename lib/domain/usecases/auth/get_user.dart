import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecases/usecase.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) {
    return sl<AuthRepository>().getUser();
  }
}
