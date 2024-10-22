import 'package:spotify_clone/domain/entities/song/song.dart';

class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;

  PlayListLoaded({required this.songs});
}

class PlayListLoadFailure extends PlayListState {
  PlayListLoadFailure();
}
