import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helper/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        backgroundColor: Color(0xff2C2B2B),
        title: Text(
          'Profile',
        ),
      ),
      body: Column(
        children: [
          _profileInfo(context),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            print(state);
            if (state is ProfileInfoLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is ProfileInfoLoaded) {
              print(state.userEntity.imageUrl);
              return Column(
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
                    height: 10,
                  ),
                  Text(
                    state.userEntity.email ?? '',
                    style: TextStyle(
                        color: context.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.userEntity.fullName ?? '',
                    style: TextStyle(
                        color: context.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }
            if (state is ProfileInfoLoadFailure) {
              return const Center(
                child: Text('Please try again later'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
