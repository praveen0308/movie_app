import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/model/movie_detail_model.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';

class GenreEntityMapper extends EntityMapper<Genre, GenreEntity> {
  @override
  Genre fromEntity(GenreEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  GenreEntity toEntity(Genre model) {
    return GenreEntity(name: model.name, id: model.id);
  }
}
