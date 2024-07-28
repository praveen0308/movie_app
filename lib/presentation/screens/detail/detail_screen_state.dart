part of 'detail_screen_cubit.dart';

@immutable
sealed class DetailScreenState {}

final class DetailScreenInitial extends DetailScreenState {}

final class LoadingDetails extends DetailScreenState {}

final class Error extends DetailScreenState {
  Error(this.message);

  final String message;
}

final class ReceivedDetails extends DetailScreenState {
  ReceivedDetails(this.details, this.trailer);

  final MovieDetailResponse details;
  final VideoEntity? trailer;
}
