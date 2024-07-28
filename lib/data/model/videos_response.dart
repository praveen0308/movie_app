import 'package:json_annotation/json_annotation.dart'; 

part 'videos_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class VideosResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'results')
  List<VideoModel>? results;

  VideosResponse({this.id, this.results});

   factory VideosResponse.fromJson(Map<String, dynamic> json) => _$VideosResponseFromJson(json);

   Map<String, dynamic> toJson() => _$VideosResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class VideoModel {
  @JsonKey(name: 'iso_639_1')
  String? iso_639_1;
  @JsonKey(name: 'iso_3166_1')
  String? iso_3166_1;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'site')
  String? site;
  @JsonKey(name: 'size')
  int? size;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'official')
  bool? official;
  @JsonKey(name: 'published_at')
  String? publishedAt;
  @JsonKey(name: 'id')
  String? id;

  VideoModel({this.iso_639_1, this.iso_3166_1, this.name, this.key, this.site, this.size, this.type, this.official, this.publishedAt, this.id});

   factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

   Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}

