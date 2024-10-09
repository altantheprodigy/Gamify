import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamify/pages/HomePage/BlocVersion/home_page_blocController.dart';
import 'package:gamify/pages/HomePage/BlocVersion/home_page_state.dart';
import 'package:gamify/pages/HomePage/widgets/home_card.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/text_style.dart';

class HomePageViewBloc extends StatelessWidget {
  const HomePageViewBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    print("ini bloc");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          "Games For You",
          style: AppTextStyle().descriptionBold(context, AppColors.fontAppBar),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomePageLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari Game...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onChanged: (value) {
                      // Implement search functionality if needed
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.games.length,
                    itemBuilder: (context, index) {
                      final game = state.games[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: HomePageCard(
                          id: game.id,
                          gameName: game.name,
                          releaseDate: game.released,
                          imagePath: game.backgroundImage,
                          rating: game.rating,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is HomePageError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement navigation ke halaman favorit di sini
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}