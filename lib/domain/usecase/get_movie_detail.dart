import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/typedefs.dart';
import 'package:movie_app/domain/entity/cast_entity.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/domain/entity/movie_entity.dart';
import 'package:movie_app/domain/entity/video_entity.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/domain/usecase/base_usecase.dart';

class MovieDetailResponse {
  MovieDetailResponse(
      this.movieDetail, this.videos, this.recommendations, this.cast);

  final MovieDetailEntity movieDetail;
  final List<VideoEntity> videos;
  final List<MovieEntity> recommendations;
  final List<CastEntity> cast;

  VideoEntity? getTrailerVideo() {
    for (var video in videos) {
      if (video.type == "Trailer" && video.official == true) {
        return video;
      }
    }
    return null;
  }
}

class GetMovieDetail
    extends BaseUseCaseWithParams<int, ResultFuture<MovieDetailResponse>> {
  GetMovieDetail(this._movieRepository);

  final MovieRepository _movieRepository;

  @override
  ResultFuture<MovieDetailResponse> call(int movieId) async {
    final results = await Future.wait([
      _movieRepository.getMovieDetail(movieId),
      _movieRepository.getMovieRecommendations(movieId),
      _movieRepository.getMovieVideoContent(movieId),
      _movieRepository.getMovieCredits(movieId),
    ]);

    late MovieDetailEntity movieDetail;
    late List<MovieEntity> recommendations;
    late List<VideoEntity> mVideos;
    late List<CastEntity> mCast;
    // results
    //     .asMap()
    //     .forEach((index, value) {
    //       switch(index){
    //         case 0:{
    //
    //         }
    //       }
    // });

    results[0].fold((failure) {
      return failure;
    }, (detail) {
      movieDetail = detail as MovieDetailEntity;
    });
    results[1].fold((failure) {
      return failure;
    }, (items) {
      recommendations = items as List<MovieEntity>;
    });
    results[2].fold((failure) {
      return failure;
    }, (videos) {
      mVideos = videos as List<VideoEntity>;
    });
    results[3].fold((failure) {
      return failure;
    }, (cast) {
      mCast = cast as List<CastEntity>;
    });

    return Right(
        MovieDetailResponse(movieDetail, mVideos, recommendations, mCast));
  }
}
