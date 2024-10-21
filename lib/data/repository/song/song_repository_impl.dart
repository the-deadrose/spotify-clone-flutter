import 'package:dartz/dartz.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getSongList() async {
    return sl<SongRepository>().getSongList();
  }
}
