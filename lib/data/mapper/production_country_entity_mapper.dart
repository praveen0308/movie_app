import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/model/movie_detail_model.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';

class ProductionCountryEntityMapper extends EntityMapper<ProductionCountry,ProductionCountryEntity>{
  @override
  ProductionCountry fromEntity(ProductionCountryEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  ProductionCountryEntity toEntity(ProductionCountry model) {
    return ProductionCountryEntity(
      name:model.name,
      iso31661: model.iso_3166_1
    );
  }
}