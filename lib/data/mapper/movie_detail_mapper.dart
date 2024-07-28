import 'package:intl/intl.dart';
import 'package:movie_app/core/utils/image_utils.dart';
import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/mapper/genre_entity_mapper.dart';
import 'package:movie_app/data/mapper/production_company_entity_mapper.dart';
import 'package:movie_app/data/mapper/production_country_entity_mapper.dart';
import 'package:movie_app/data/mapper/spoken_language_entity_mapper.dart';
import 'package:movie_app/data/model/movie_detail_model.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';

class MovieDetailMapper
    implements EntityMapper<MovieDetailModel, MovieDetailEntity> {
  @override
  MovieDetailModel fromEntity(MovieDetailEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  MovieDetailEntity toEntity(MovieDetailModel model) {
    return MovieDetailEntity(
        adult: model.adult,
        backdropPath: ImageUtils.getFinalImageUrl(
            ImageQuality.w500, model.backdropPath ?? ""),
        belongsToCollection: model.belongsToCollection,
        budget: model.budget,
        genres:
            model.genres?.map((e) => GenreEntityMapper().toEntity(e)).toList(),
        homepage: model.homepage,
        id: model.id,
        imdbId: model.imdbId,
        originalLanguage: model.originalLanguage,
        originalTitle: model.originalTitle,
        overview: model.overview,
        popularity: model.popularity,
        posterPath: ImageUtils.getFinalImageUrl(
            ImageQuality.w500, model.posterPath ?? ""),
        productionCompanies: model.productionCompanies
            ?.map((e) => ProductionCompanyEntityMapper().toEntity(e))
            .toList(),
        productionCountries: model.productionCountries
            ?.map((e) => ProductionCountryEntityMapper().toEntity(e))
            .toList(),
        releaseDate: DateFormat("MMM dd, yyyy")
            .format(DateTime.parse(model.releaseDate ?? "")),
        revenue: model.revenue,
        runtime: model.runtime,
        spokenLanguages: model.spokenLanguages
            ?.map((e) => SpokenLanguageEntityMapper().toEntity(e))
            .toList(),
        status: model.status,
        tagline: model.tagline,
        title: model.title,
        video: model.video,
        voteAverage: model.voteAverage,
        voteCount: model.voteCount);
  }
}
