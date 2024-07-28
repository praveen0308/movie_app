part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class Loading extends HomeScreenState {}

final class Failed extends HomeScreenState {
  Failed(this.message);

  final String message;
}

final class DataLoaded extends HomeScreenState {
  DataLoaded(this.items);

  final List<HomeListingItem> items;
}
