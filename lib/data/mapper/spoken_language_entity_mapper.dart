import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/model/movie_detail_model.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';

class SpokenLanguageEntityMapper extends EntityMapper<SpokenLanguage,SpokenLanguageEntity>{
  @override
  SpokenLanguage fromEntity(SpokenLanguageEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  SpokenLanguageEntity toEntity(SpokenLanguage model) {
    return SpokenLanguageEntity(
      name:model.name,
      englishName: model.englishName,
      iso6391: model.iso_639_1,
    );
  }
}