import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamify/api/game_response_model.dart';
import 'package:gamify/pages/HomePage/BlocVersion/home_page_event.dart';
import 'package:gamify/pages/HomePage/BlocVersion/home_page_state.dart';
import 'package:http/http.dart' as http;

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<LoadGames>((event, emit) async {
      emit(HomePageLoading());
      try {
        final games = await fetchGames();
        emit(HomePageLoaded(games));
      } catch (e) {
        emit(HomePageError("Failed to fetch games."));
      }
    });
  }

  Future<List<Result>> fetchGames() async {
    const String apiKey = "48d237decca24ad3a5a4d253dbaf6473";
    final response = await http.get(Uri.parse(
        "https://api.rawg.io/api/games?key=$apiKey&page=1&page_size=10"));

    if (response.statusCode == 200) {
      final gameResponse = gameResponseModelFromJson(response.body);
      return gameResponse.results;
    } else {
      throw Exception("Failed to load games");
    }
  }
}
