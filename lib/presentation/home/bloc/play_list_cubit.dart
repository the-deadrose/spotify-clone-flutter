import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/play_list_state.dart';
import 'package:spotify_clone/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold((l) {
      emit(PlayListLoadFailure());
    }, (r) {
      emit(PlayListLoaded(songs: r));
    });
  }
}
