// detail_page_view_bloc.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamify/pages/DetailPage/BlocVersion/detail_page_blocController.dart';
import 'package:gamify/pages/DetailPage/BlocVersion/detail_page_event.dart';
import 'package:gamify/pages/DetailPage/BlocVersion/detail_page_state.dart';
import 'package:gamify/utils/app_responsive.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/common_app_bar.dart';
import 'package:gamify/utils/extension.dart';
import 'package:gamify/utils/text_style.dart';
import 'package:intl/intl.dart';

class DetailPageViewBloc extends StatelessWidget {
  const DetailPageViewBloc({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ini detail bloc");
    final int gameId = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => DetailPageBloc()..add(LoadDetailPage(gameId)),
      child: Scaffold(
        appBar: CommonAppBar(
          title: "Detail Page",
          route: () {
            Navigator.of(context).pop();
          },
        ),
        body: BlocBuilder<DetailPageBloc, DetailPageState>(
          builder: (context, state) {
            if (state is DetailPageLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.hargaStat,
                ),
              );
            } else if (state is DetailPageLoaded) {
              final gameDetail = state.gameDetail;
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
                      padding: const EdgeInsets.all(12),
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
                              IconButton(
                                onPressed: () {
                                  // Implement your favorite logic here
                                },
                                icon: Icon(
                                  Icons.favorite_outline_rounded,
                                  color: AppColors.hargaStat,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            gameDetail.name,
                            style: AppTextStyle()
                                .title(context, AppColors.background),
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(gameDetail.released),
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
                                style: AppTextStyle().descriptionBold(
                                    context, AppColors.background),
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
            } else if (state is DetailPageError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
