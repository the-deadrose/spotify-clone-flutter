import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  final String? title;
  final String? artist;
  final num? duration;
  final Timestamp? releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      title: map['title'],
      artist: map['artist'],
      duration: map['duration'],
      releaseDate: map['releaseDate'],
    );
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
    );
  }
}
