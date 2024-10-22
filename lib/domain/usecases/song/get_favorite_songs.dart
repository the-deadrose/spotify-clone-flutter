import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class GetFavouriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongRepository>().getFavoriteSongs();
  }
}
