import 'package:spotify_clone/domain/entities/song/song.dart';

class FavoriteSongState {}

class FavoriteSongLoading extends FavoriteSongState {}

class FavoriteSongLoaded extends FavoriteSongState {
  final List<SongEntity> songs;

  FavoriteSongLoaded({required this.songs});
}

class FavoriteSongLoadFailure extends FavoriteSongState {}
