import 'package:movie_app/data/mapper/entity_mapper.dart';
import 'package:movie_app/data/model/videos_response.dart';
import 'package:movie_app/domain/entity/video_entity.dart';

class VideoEntityMapper  implements EntityMapper<VideoModel,VideoEntity>{
  @override
  VideoModel fromEntity(VideoEntity entity) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  VideoEntity toEntity(VideoModel model) {
    return VideoEntity(
      iso6391: model.iso_639_1,
      iso31661: model.iso_3166_1,
      name: model.name,
      key: model.key,
      site: model.site,
      size: model.size,
      type: model.type,
      official: model.official,
      publishedAt: model.publishedAt,
      id: model.id,
    );
  }

}