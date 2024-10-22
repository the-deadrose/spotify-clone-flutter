import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/get_favorite_songs.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_song_state.dart';
import 'package:spotify_clone/service_locator.dart';

class FavoriteSongCubit extends Cubit<FavoriteSongState> {
  FavoriteSongCubit() : super(FavoriteSongLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavouriteSongs() async {
    var result = await sl<GetFavouriteSongUseCase>().call();

    result.fold((l) {
      emit(FavoriteSongLoadFailure());
    }, (r) {
      favoriteSongs = r;
      emit(FavoriteSongLoaded(songs: favoriteSongs));
    });
  }

  void removeSongs(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongLoaded(songs: favoriteSongs));
  }
}
