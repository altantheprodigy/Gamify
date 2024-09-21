import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gamify/api/game_response_model.dart';

class HomePageController extends GetxController {
  final TextEditingController queryController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxBool isLoadMore = false.obs;
  String apiKey = "48d237decca24ad3a5a4d253dbaf6473";
  RxList<Result> listGame = <Result>[].obs;
  int currentPage = 1;
  bool hasMoreData = true;

  @override
  void onInit() {
    super.onInit();
    loadData();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoadMore.value &&
        hasMoreData) {
      loadMoreData();
    }
  }

  loadData() async {
    isLoading.value = true;
    currentPage = 1;
    final response = await http.get(Uri.parse(
        "https://api.rawg.io/api/games?key=$apiKey&page=$currentPage&page_size=10"));

    if (response.statusCode == 200) {
      final gameResponse = gameResponseModelFromJson(response.body);
      listGame.value = gameResponse.results;
      hasMoreData = gameResponse.results.isNotEmpty;
    } else {
      Get.snackbar("Error Fetching API", "Status Code: ${response.statusCode}");
    }

    isLoading.value = false;
  }

  loadMoreData() async {
    isLoadMore.value = true;
    currentPage += 1;
    final response = await http.get(Uri.parse(
        "https://api.rawg.io/api/games?key=$apiKey&page=$currentPage&page_size=10"));

    if (response.statusCode == 200) {
      final gameResponse = gameResponseModelFromJson(response.body);
      if (gameResponse.results.isNotEmpty) {
        listGame.addAll(gameResponse.results);
      } else {
        hasMoreData = false;
      }
    } else {
      Get.snackbar("Error Fetching API", "Status Code: ${response.statusCode}");
    }

    isLoadMore.value = false;
  }
}
