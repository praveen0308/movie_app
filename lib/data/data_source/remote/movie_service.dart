import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/data/model/credits_response.dart';
import 'package:movie_app/data/model/movie_detail_model.dart';
import 'package:movie_app/data/model/movie_list_response.dart';
import 'package:movie_app/data/model/videos_response.dart';

abstract class MovieService {
  Future<MovieListResponse> getPopularMovies({int pageNo = 1});

  Future<MovieListResponse> getTopRatedMovies();

  Future<MovieListResponse> getUpcomingMovies();

  Future<MovieDetailModel> getMovieDetail(int movieId);

  Future<MovieListResponse> getRecommendations(int movieId);

  Future<VideosResponse> getVideoContent(int movieId);

  Future<CreditsResponse> getMovieCredits(int movieId);
}

class MovieServiceImpl implements MovieService {
  MovieServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<MovieListResponse> getPopularMovies({int pageNo = 1}) async {
    try {
      final url = '/movie/popular?language=en-US&page=$pageNo';

      final response = await _dio.get(url);
      return MovieListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.statusMessage ?? "Unknown Error!!!",
        statusCode: e.response?.statusCode.toString() ?? '505',
      );
    }
  }

  @override
  Future<MovieListResponse> getTopRatedMovies({int pageNo = 1}) async {
    try {
      final url = '/movie/top_rated?language=en-US&page=$pageNo';

      final response = await _dio.get(url);
      return MovieListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.statusMessage ?? "Unknown Error!!!",
        statusCode: e.response?.statusCode.toString() ?? '505',
      );
    }
  }

  @override
  Future<MovieListResponse> getUpcomingMovies({int pageNo = 1}) async {
    try {
      final url = '/movie/upcoming?language=en-US&page=$pageNo';

      final response = await _dio.get(url);
      return MovieListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.statusMessage ?? "Unknown Error!!!",
        statusCode: e.response?.statusCode.toString() ?? '505',
      );
    }
  }

  @override
  Future<CreditsResponse> getMovieCredits(int movieId) async {
    try {
      final url = '/movie/$movieId/credits?language=en-US';

      final response = await _dio.get(url);
      return CreditsResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.statusMessage ?? "Unknown Error!!!",
        statusCode: e.response?.statusCode.toString() ?? '505',
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    try {
      final url = '/movie/$movieId?language=en-US';

      final response = await _dio.get(url);
      return MovieDetailModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.statusMessage ?? "Unknown Error!!!",
        statusCode: e.response?.statusCode.toString() ?? '505',
      );
    }
  }

  @override
  Future<MovieListResponse> getRecommendations(int movieId,
      {int pageNo = 1}) async {
    try {
      final url = '/movie/$movieId/recommendations?language=en-US&page=$pageNo';

      final response = await _dio.get(url);
      return MovieListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.statusMessage ?? "Unknown Error!!!",
        statusCode: e.response?.statusCode.toString() ?? '505',
      );
    }
  }

  @override
  Future<VideosResponse> getVideoContent(int movieId) async {
    try {
      final url = '/movie/$movieId/videos?language=en-US';

      final response = await _dio.get(url);
      return VideosResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.statusMessage ?? "Unknown Error!!!",
        statusCode: e.response?.statusCode.toString() ?? '505',
      );
    }
  }
}
