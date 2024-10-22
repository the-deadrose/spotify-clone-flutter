import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/song/song.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getSongList();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getSongList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      print('datatatattatattatatattaaaaaaaaa ${data.docs.first.get('title')}');

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity(),
        );
      }
      return Right(songs);
    } catch (e) {
      return const Left('Error fetching songs');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();

      print('datatatattatattatatattaaaaaaaaa ${data.docs.first.get('title')}');

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity(),
        );
      }
      return Right(songs);
    } catch (e) {
      return const Left('Error fetching songs');
    }
  }
}
