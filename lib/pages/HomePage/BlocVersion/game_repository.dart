// game_repository.dart
import 'package:gamify/api/game_response_model.dart';
import 'package:http/http.dart' as http;

class GameRepository {
  final String apiKey = "48d237decca24ad3a5a4d253dbaf6473";

  // Future<List<Result>> fetchGames({int page = 1}) async {
  //   final response = await http.get(Uri.parse(
  //       "https://api.rawg.io/api/games?key=$apiKey&page=$page&page_size=10"));
  //   if (response.statusCode == 200) {
  //     final gameResponse = gameResponseModelFromJson(response.body);
  //     return gameResponse.results;
  //   } else {
  //     throw Exception("Gagal mengambil game.");
  //   }
  // }

  // Future<List<Result>> searchGames(String query) async {
  //   final response = await http.get(Uri.parse(
  //       "https://api.rawg.io/api/games?key=$apiKey&search=$query&page_size=10"));
  //   if (response.statusCode == 200) {
  //     final gameResponse = gameResponseModelFromJson(response.body);
  //     return gameResponse.results;
  //   } else {
  //     throw Exception("Gagal mencari game.");
  //   }
  // }
}
