import 'package:flutter/material.dart';
import 'package:gamify/api/search_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SeacrhPageController extends GetxController {
  final TextEditingController queryController = TextEditingController();
  RxBool isLoading = false.obs;
  String apiKey = "48d237decca24ad3a5a4d253dbaf6473";
  RxList<Result> listGame = <Result>[].obs;

  searchData(String query) async {
    isLoading.value = true;
    final response = await http.get(
        Uri.parse("https://api.rawg.io/api/games?search=$query&key=$apiKey"));
    if (response.statusCode == 200) {
      final gameResponse = searchGameResponseModelFromJson(response.body);
      listGame.value = gameResponse.results;
    } else {
      Get.snackbar("Eror FetchApi", "Status Code: ${response.statusCode}");
    }
    isLoading.value = false;
  }
}
