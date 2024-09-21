import 'package:flutter/material.dart';
import 'package:gamify/pages/SearchPage/search_page_controller.dart';
import 'package:gamify/pages/SearchPage/widgets/search_card.dart';
import 'package:gamify/utils/app_responsive.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/common_app_bar.dart';
import 'package:gamify/utils/extension.dart';
import 'package:gamify/utils/text_style.dart';
import 'package:get/get.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SeacrhPageController());
    return Scaffold(
      appBar: CommonAppBar(
          title: "Search Page",
          route: () {
            Get.back();
          }),
      body: RefreshIndicator(
        edgeOffset: 10,
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 2),
          () {},
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Obx(() {
            if (controller.isLoading.value) {
              return SizedBox(
                height: AppResponsive().screenHeight(context) * 0.4,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.hargaStat,
                  ),
                ),
              );
            } else if (controller.listGame.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.gamepad,
                      color: Colors.red,
                      size: 72,
                    ),
                    Text(
                      'No Item',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: controller.listGame.length,
                itemBuilder: (BuildContext context, int index) {
                  final game = controller.listGame[index];
                  return SearchPageCard(
                    id: game.id,
                    gameName: game.name,
                    releaseDate: game.released ?? DateTime.now(),
                    imagePath: game.backgroundImage ?? "http://via.placeholder.com/1280x720",
                    rating: game.rating,
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
