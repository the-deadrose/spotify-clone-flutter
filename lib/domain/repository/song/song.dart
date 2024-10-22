import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getSongList();
  Future<Either> getPlayList();
}
