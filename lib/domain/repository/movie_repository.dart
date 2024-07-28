import 'package:movie_app/core/utils/typedefs.dart';
import 'package:movie_app/domain/entity/cast_entity.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/domain/entity/movie_entity.dart';
import 'package:movie_app/domain/entity/video_entity.dart';

abstract class MovieRepository {
  ResultFuture<List<MovieEntity>> getPopularMovies();

  ResultFuture<List<MovieEntity>> getTopRateMovies();

  ResultFuture<List<MovieEntity>> getUpComingMovies();

  ResultFuture<List<MovieEntity>> getMovieRecommendations(int movieId);

  ResultFuture<MovieDetailEntity> getMovieDetail(int movieId);

  ResultFuture<List<CastEntity>> getMovieCredits(int movieId);

  ResultFuture<List<VideoEntity>> getMovieVideoContent(int movieId);
}
