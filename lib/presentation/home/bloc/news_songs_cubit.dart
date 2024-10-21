import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsInitial());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold((l) {
      emit(NewsSongsLoadFailure());
    }, (r) {
      emit(NewsSongsLoaded(songs: r));
    });
  }
}
