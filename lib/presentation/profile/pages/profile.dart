import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helper/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/constant/app_urls.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_song_cubit.dart';
import 'package:spotify_clone/presentation/profile/bloc/favorite_song_state.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify_clone/presentation/song_player/pages/song_player.dart';
import '../../../common/widgets/favorite_button/favorite_button.dart';
import '../bloc/profile_info_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        backgroundColor: Color(0xff2C2B2B),
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          const SizedBox(
            height: 30,
          ),
          _favoriteSongs()
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }
            if (state is ProfileInfoLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(state.userEntity.imageUrl!))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(state.userEntity.email!),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.userEntity.fullName!,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }

            if (state is ProfileInfoLoadFailure) {
              return const Text('Please try again');
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _favoriteSongs() {
    return BlocProvider(
      create: (context) => FavoriteSongCubit()..getFavouriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FAVORITE SONGS',
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<FavoriteSongCubit, FavoriteSongState>(
              builder: (context, state) {
                if (state is FavoriteSongLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is FavoriteSongLoaded) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SongPlayerPage(
                                            song: state.songs[index])));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${AppUrls.coverFireStorage}${state.songs[index].title} - ${state.songs[index].artist}.jpeg?${AppUrls.mediaAlt}'))),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.songs[index].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        state.songs[index].artist,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.songs[index].duration
                                      .toString()
                                      .replaceAll('.', ':')),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  FavoriteButton(
                                    songEntity: state.songs[index],
                                    key: UniqueKey(),
                                    function: () {
                                      context
                                          .read<FavoriteSongCubit>()
                                          .removeSongs(index);
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: state.songs.length);
                }
                if (state is FavoriteSongLoadFailure) {
                  return const Text('Please try again.');
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
