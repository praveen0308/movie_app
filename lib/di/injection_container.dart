import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/data/data_source/remote/movie_service.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/domain/usecase/get_home_listing.dart';
import 'package:movie_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_app/presentation/screens/detail/detail_screen_cubit.dart';
import 'package:movie_app/presentation/screens/home/home_screen_cubit.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  final options = BaseOptions(
      contentType: Headers.jsonContentType,
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        Headers.acceptHeader: Headers.jsonContentType,
        'Authorization': 'Bearer $accessToken',
      },

  );
  final dio = Dio(options);
  dio.interceptors.add(LogInterceptor());

  locator
  // Bloc+Cubits
    ..registerFactory(() => HomeScreenCubit(locator()))
    ..registerFactory(() => DetailScreenCubit(locator()))

    // Usecasess
    ..registerLazySingleton(() => GetHomeListingUseCase(locator()))
    ..registerLazySingleton(() => GetMovieDetail(locator()))

    // Repositories
    ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(locator()))

    // Services
    ..registerLazySingleton<MovieService>(() => MovieServiceImpl(locator()))

    // Clients
    ..registerLazySingleton<Dio>(() => dio);
}
