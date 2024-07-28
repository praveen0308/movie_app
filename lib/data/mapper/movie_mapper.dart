import 'package:intl/intl.dart';
import 'package:movie_app/core/utils/image_utils.dart';
import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/model/movie_list_response.dart';
import 'package:movie_app/domain/entity/movie_entity.dart';

class MovieMapper implements EntityMapper<MovieModel, MovieEntity> {
  @override
  MovieModel fromEntity(MovieEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  MovieEntity toEntity(MovieModel model) {
    return MovieEntity(
      adult: model.adult,
      backdropPath: model.backdropPath,
      genreIds: model.genreIds,
      id: model.id,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: ImageUtils.getFinalImageUrl(
          ImageQuality.w500, model.posterPath ?? ""),
      releaseDate: DateFormat("MMM dd, yyyy")
          .format(DateTime.parse(model.releaseDate ?? "")),
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}
