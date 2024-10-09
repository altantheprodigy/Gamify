// detail_page_event.dart
import 'package:equatable/equatable.dart';

abstract class DetailPageEvent extends Equatable {
  const DetailPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadDetailPage extends DetailPageEvent {
  final int gameId;

  const LoadDetailPage(this.gameId);

  @override
  List<Object?> get props => [gameId];
}
