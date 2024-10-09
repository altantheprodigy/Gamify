// detail_page_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamify/api/detail_game_response_model.dart';
import 'package:gamify/pages/DetailPage/BlocVersion/detail_page_event.dart';
import 'package:gamify/pages/DetailPage/BlocVersion/detail_page_state.dart';
import 'package:http/http.dart' as http;

class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  final String apiKey = "48d237decca24ad3a5a4d253dbaf6473";

  DetailPageBloc() : super(DetailPageLoading()) {
    on<LoadDetailPage>((event, emit) async {
      emit(DetailPageLoading());

      try {
        final response = await http.get(
            Uri.parse("https://api.rawg.io/api/games/${event.gameId}?key=$apiKey"));
        if (response.statusCode == 200) {
          final DetailGameResponseModel gameDetail = detailGameResponseModelFromJson(response.body);
          emit(DetailPageLoaded(gameDetail));
        } else {
          emit(const DetailPageError("Failed to load game details"));
        }
      } catch (e) {
        emit(DetailPageError(e.toString()));
      }
    });
  }
}
