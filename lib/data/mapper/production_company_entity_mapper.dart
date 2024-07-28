import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/model/movie_detail_model.dart';
import 'package:movie_app/domain/entity/movie_detail_entity.dart';

class ProductionCompanyEntityMapper extends EntityMapper<ProductionCompany,ProductionCompanyEntity>{
  @override
  ProductionCompany fromEntity(ProductionCompanyEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  ProductionCompanyEntity toEntity(ProductionCompany model) {
    return ProductionCompanyEntity(
      id:model.id,
      logoPath: model.logoPath,
      name:model.name,
      originCountry: model.originCountry
    );
  }
}