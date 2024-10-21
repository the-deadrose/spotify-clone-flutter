import 'package:spotify_clone/domain/entities/song/song.dart';

class NewsSongsState {}

class NewsSongsInitial extends NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongsLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewsSongsState {
  NewsSongsLoadFailure();
}
