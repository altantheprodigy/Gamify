import 'package:gamify/api/game_response_model.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<Result> games;

  HomePageLoaded(this.games);
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError(this.message);
}
