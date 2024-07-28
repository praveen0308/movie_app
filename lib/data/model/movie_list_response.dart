import 'package:json_annotation/json_annotation.dart'; 

part 'movie_list_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class MovieListResponse {
  @JsonKey(name: 'dates')
  Dates? dates;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<MovieModel>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  MovieListResponse({this.dates, this.page, this.results, this.totalPages, this.totalResults});

   factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

   Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Dates {
  @JsonKey(name: 'maximum')
  String? maximum;
  @JsonKey(name: 'minimum')
  String? minimum;

  Dates({this.maximum, this.minimum});

   factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

   Map<String, dynamic> toJson() => _$DatesToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class MovieModel {
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'video')
  bool? video;
  @JsonKey(name: 'vote_average')
  int? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MovieModel({this.adult, this.backdropPath, this.genreIds, this.id, this.originalLanguage, this.originalTitle, this.overview, this.popularity, this.posterPath, this.releaseDate, this.title, this.video, this.voteAverage, this.voteCount});

   factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

   Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

