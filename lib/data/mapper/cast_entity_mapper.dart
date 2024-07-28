import 'package:movie_app/core/utils/image_utils.dart';
import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/model/cast_model.dart';
import 'package:movie_app/domain/entity/cast_entity.dart';

class CastEntityMapper implements EntityMapper<CastModel, CastEntity> {
  @override
  CastModel fromEntity(CastEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  CastEntity toEntity(CastModel model) {
    return CastEntity(
      adult: model.adult,
      gender: model.gender,
      id: model.id,
      knownForDepartment: model.knownForDepartment,
      name: model.name,
      originalName: model.originalName,
      popularity: model.popularity,
      profilePath: ImageUtils.getFinalImageUrl(
          ImageQuality.w500, model.profilePath ?? ""),
      castId: model.castId,
      character: model.character,
      creditId: model.creditId,
      order: model.order,
    );
  }
}
