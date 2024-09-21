import 'package:flutter/material.dart';
import 'package:gamify/pages/FavoritPage/favorite_page_controller.dart';
import 'package:gamify/pages/FavoritPage/widgets/favorite_card.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/common_app_bar.dart';
import 'package:get/get.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritePageController favoritePageController =
    Get.put(FavoritePageController());
    return Scaffold(
      appBar: CommonAppBar(
          title: "Favorite Page",
          route: () {
            Get.back();
          }),
      body: Obx((){
        if(favoritePageController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.hargaStat,
            ),
          );
        } else if (favoritePageController.favorites.isEmpty){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                  size: 72,
                ),
                Text(
                  'No Favorite Item',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView.builder(
              itemCount: favoritePageController.favorites.length,
              itemBuilder: (BuildContext context, int index) {
                final game = favoritePageController.favorites[index];
                return FavoriteCard(
                  id: game.id,
                  gameName: game.title,
                  releaseDate: DateTime.parse(game.released),
                  imagePath: game.image,
                  rating: game.rating,
                );
              },
            ),
          );
        }
      })
    );
  }
}
