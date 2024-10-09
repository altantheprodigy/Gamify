// detail_page_state.dart
import 'package:equatable/equatable.dart';
import 'package:gamify/api/detail_game_response_model.dart';

abstract class DetailPageState extends Equatable {
  const DetailPageState();

  @override
  List<Object?> get props => [];
}

class DetailPageLoading extends DetailPageState {}

class DetailPageLoaded extends DetailPageState {
  final DetailGameResponseModel gameDetail;

  const DetailPageLoaded(this.gameDetail);

  @override
  List<Object?> get props => [gameDetail];
}

class DetailPageError extends DetailPageState {
  final String message;

  const DetailPageError(this.message);

  @override
  List<Object?> get props => [message];
}
