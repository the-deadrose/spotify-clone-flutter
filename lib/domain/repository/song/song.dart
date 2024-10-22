import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getSongList();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSongs(String songId);
  Future<bool> isFavoriteSong(String songId);
}
