import 'package:movie_app/domain/entity/movie_entity.dart';

abstract class HomeListingItem {
  HomeListingItem(this.title, this.position);

  final String title;
  final int position;
}

class PopularMovies extends HomeListingItem {
  PopularMovies(super.title, super.position, this.movies);

  final List<MovieEntity> movies;
}

class TopRatedMovies extends HomeListingItem {
  TopRatedMovies(super.title, super.position, this.movies);

  final List<MovieEntity> movies;
}

class UpcomingMovies extends HomeListingItem {
  UpcomingMovies(super.title, super.position, this.movies);

  final List<MovieEntity> movies;
}
