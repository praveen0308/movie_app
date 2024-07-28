class MovieDetailEntity {
  MovieDetailEntity({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<GenreEntity>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanyEntity>? productionCompanies;
  List<ProductionCountryEntity>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguageEntity>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

}

class SpokenLanguageEntity {
  SpokenLanguageEntity({
      this.englishName, 
      this.iso6391, 
      this.name,});

  String? englishName;
  String? iso6391;
  String? name;

}

class ProductionCountryEntity {
  ProductionCountryEntity({
      this.iso31661, 
      this.name,});

  String? iso31661;
  String? name;

}

class ProductionCompanyEntity {
  ProductionCompanyEntity({
      this.id, 
      this.logoPath, 
      this.name, 
      this.originCountry,});

  int? id;
  String? logoPath;
  String? name;
  String? originCountry;


}

class GenreEntity {
  GenreEntity({
      this.id, 
      this.name,});
  int? id;
  String? name;

}