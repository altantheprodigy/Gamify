import 'package:flutter/material.dart';
import 'package:gamify/api/favorite_model.dart';
import 'package:gamify/pages/DetailPage/detail_page_controller.dart';
import 'package:gamify/pages/FavoritPage/favorite_page_controller.dart';
import 'package:gamify/utils/app_responsive.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/common_app_bar.dart';
import 'package:gamify/utils/extension.dart';
import 'package:gamify/utils/text_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritePageController favoritePageController =
        Get.put(FavoritePageController());
    final controller = Get.put(DetailPageController());
    return Scaffold(
      appBar: CommonAppBar(
        title: "Detail Page",
        route: () {
          Get.back();
        },
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.hargaStat,
            ),
          );
        } else if (controller.gameDetail.value == null) {
          return Center(
            child: Text("kosong"),
          );
        } else {
          final gameDetail = controller.gameDetail.value!;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  gameDetail.backgroundImage,
                  fit: BoxFit.cover,
                  height: AppResponsive().screenWidth(context) * 0.850,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              gameDetail.developers
                                  .map((developer) => developer.name)
                                  .join(", "),
                              style: AppTextStyle().descriptionBold(
                                  context, AppColors.background),
                            ),
                          ),
                          Obx(() => IconButton(
                              onPressed: () {
                                favoritePageController.tapLike(
                                  Favorite(
                                      id: gameDetail.id,
                                      title: gameDetail.name,
                                      rating: gameDetail.rating.toString(),
                                      image: gameDetail.backgroundImage,
                                      released: gameDetail.released.toString()),
                                );
                              },
                              icon: Icon(
                                favoritePageController
                                        .checkFavorite(gameDetail.id)
                                        .value
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline_rounded,
                                color: AppColors.hargaStat,
                                size: 20,
                              )))
                        ],
                      ),
                      Text(
                        gameDetail.name,
                        style:
                            AppTextStyle().title(context, AppColors.background),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy').format(gameDetail.released),
                        style: AppTextStyle()
                            .descriptionBold(context, AppColors.background),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: AppColors.bintang,
                          ),
                          Text(
                            gameDetail.rating.toString(),
                            style: AppTextStyle()
                                .descriptionBold(context, AppColors.background),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.videogame_asset,
                                size: 20,
                                color: AppColors.background,
                              ),
                              Text(
                                "${gameDetail.addedByStatus.owned} Owned",
                                style: AppTextStyle().descriptionBold(
                                    context, AppColors.background),
                              ),
                            ].withSpaceBetween(width: 5),
                          )
                        ].withSpaceBetween(width: 5),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        gameDetail.description,
                        style: AppTextStyle()
                            .descriptionBold(context, AppColors.background),
                      ),
                    ],
                  ),
                )
              ].withSpaceBetween(height: 10),
            ),
          );
        }
      }),
    );
  }
}
