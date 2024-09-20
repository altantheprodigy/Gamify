import 'package:gamify/api/detail_game_response_model.dart';
import 'package:gamify/api/game_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailPageController extends GetxController{
  RxBool isLoading = false.obs;
  String apiKey = "48d237decca24ad3a5a4d253dbaf6473";
  Rxn<DetailGameResponseModel> gameDetail = Rxn<DetailGameResponseModel>();

  @override
  void onInit() {
    final gameId = Get.arguments as int;
    loadDetailData(gameId);
    super.onInit();
  }

  loadDetailData(int gameId) async {
    isLoading.value = true;
    final response = await http.get(
        Uri.parse("https://api.rawg.io/api/games/$gameId?key=$apiKey"));
    if(response.statusCode == 200) {
      final DetailGameResponseModel detailGame = detailGameResponseModelFromJson(response.body);
      gameDetail.value = detailGame;
    }
    isLoading.value = false;
  }
}