import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamify/pages/HomePage/home_page_controller.dart';
import 'package:gamify/pages/HomePage/widgets/home_card.dart';
import 'package:gamify/utils/app_responsive.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/extension.dart';
import 'package:gamify/utils/text_style.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> refreshData() async {
    final HomePageController controller = Get.find<HomePageController>();
    await controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Games For You",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.background,
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () {
            Get.toNamed("/favorit-page");
          },
          child: Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(64),
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        edgeOffset: 10,
        color: AppColors.hargaStat,
        backgroundColor: AppColors.cardIconFill,
        strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
        onRefresh: () => Future.delayed(
          const Duration(seconds: 2),
          refreshData,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                        controller: controller.queryController,
                    style: AppTextStyle()
                        .descriptionBold(context, AppColors.background),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.cardIconFill,
                      hintText: 'Cari Game...',
                      hintStyle: AppTextStyle()
                          .descriptionBold(context, AppColors.background),
                    ),
                  )),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.cardIconFill),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GestureDetector(
                      onTap: () async {
                        if(controller.queryController.text.isNotEmpty) {
                          String query = controller.queryController.text;
                          await controller.searchData(query);
                        } else {
                          await controller.loadData();
                        }
                      },
                      child: Icon(
                        Icons.search,
                        size: 20,
                        color: AppColors.background,
                      ),
                    ),
                  )
                ].withSpaceBetween(width: 10),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return SizedBox(
                    height: AppResponsive().screenHeight(context) * 0.4,
                    child:  Center(
                      child: CircularProgressIndicator(
                        color: AppColors.hargaStat,
                      ),
                    ),
                  );
                } else if (controller.listGame.isEmpty) {
                  return const Center(
                    child: Text("Data Kosong"),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.listGame.length,
                      itemBuilder: (BuildContext context, int index) {
                        final game = controller.listGame[index];
                        return HomePageCard(
                          id: game.id,
                          gameName: game.name,
                          releaseDate: game.released,
                          imagePath: game.backgroundImage,
                          rating: game.rating,
                        );
                      },
                    ),
                  );
                }
              }),
            ].withSpaceBetween(height: 10),
          ),
        ),
      ),
    );
  }
}
