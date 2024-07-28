import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/model/cast_model.dart';

part 'credits_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CreditsResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'cast')
  List<CastModel>? cast;
  @JsonKey(name: 'crew')
  List<CastModel>? crew;

  CreditsResponse({this.id, this.cast, this.crew});

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsResponseToJson(this);
}
