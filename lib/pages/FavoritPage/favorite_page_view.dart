import 'package:flutter/material.dart';
import 'package:gamify/pages/FavoritPage/widgets/favorite_card.dart';
import 'package:gamify/utils/common_app_bar.dart';
import 'package:get/get.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: "Detail Page",
          route: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            // final game = controller.listGame[index];
            return FavoriteCard(
              gameName: "game.name",
              releaseDate: DateTime.now(),
              imagePath: "https://ui-avatars.com/api/?name=altanputra&background=db6767&color=fafafa",
              rating: 4.5,
            );
          },
        ),
      ),
    );
  }
}
