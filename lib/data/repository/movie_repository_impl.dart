import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/utils/typedefs.dart';
import 'package:movie_app/data/data_source/remote/movie_service.dart';
import 'package:movie_app/data/mapper/cast_entity_mapper.dart';
import 'package:movie_app/data/mapper/movie_detail_mapper.dart';
import 'package:movie_app/data/mapper/movie_mapper.dart';
import 'package:movie_app/data/mapper/video_entity_mapper.dart';
import 'package:movie_app/domain/entity/cast_entity.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/domain/entity/movie_entity.dart';
import 'package:movie_app/domain/entity/video_entity.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieService);

  final MovieService _movieService;

  @override
  ResultFuture<List<MovieEntity>> getPopularMovies() async {
    try {
      final mapper = MovieMapper();
      final result = await _movieService.getPopularMovies();

      return Right(
        result.results?.map(mapper.toEntity).toList() ?? List.empty(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<MovieEntity>> getTopRateMovies() async {
    try {
      final mapper = MovieMapper();
      final result = await _movieService.getTopRatedMovies();

      return Right(
        result.results?.map(mapper.toEntity).toList() ?? List.empty(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<MovieEntity>> getUpComingMovies() async {
    try {
      final mapper = MovieMapper();
      final result = await _movieService.getUpcomingMovies();

      return Right(
        result.results?.map(mapper.toEntity).toList() ?? List.empty(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<CastEntity>> getMovieCredits(int movieId) async {
    try {
      final mapper = CastEntityMapper();
      final result = await _movieService.getMovieCredits(movieId);

      return Right(
        result.cast?.map(mapper.toEntity).toList() ?? List.empty(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<MovieDetailEntity> getMovieDetail(int movieId) async {
    try {
      final mapper = MovieDetailMapper();
      final result = await _movieService.getMovieDetail(movieId);

      return Right(mapper.toEntity(result));
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<MovieEntity>> getMovieRecommendations(int movieId) async {
    try {
      final mapper = MovieMapper();
      final result = await _movieService.getRecommendations(movieId);

      return Right(
        result.results?.map(mapper.toEntity).toList() ?? List.empty(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<VideoEntity>> getMovieVideoContent(int movieId) async {
    try {
      final mapper = VideoEntityMapper();
      final result = await _movieService.getVideoContent(movieId);

      return Right(
        result.results?.map(mapper.toEntity).toList() ?? List.empty(),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
