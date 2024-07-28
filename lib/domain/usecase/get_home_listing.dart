import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/res/app_strings.dart';
import 'package:movie_app/core/utils/typedefs.dart';
import 'package:movie_app/domain/entity/home_listing_item.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/domain/usecase/base_usecase.dart';

class GetHomeListingUseCase
    extends BaseUseCaseWithoutParams<ResultFuture<List<HomeListingItem>>> {
  GetHomeListingUseCase(this._movieRepository);

  final MovieRepository _movieRepository;

  @override
  ResultFuture<List<HomeListingItem>> call() async {
    final results = await Future.wait([
      _movieRepository.getPopularMovies(),
      _movieRepository.getTopRateMovies(),
      _movieRepository.getUpComingMovies()
    ]);

    var listing = <HomeListingItem>[];
    results.asMap().forEach((index, value) {
      switch (index) {
        case 0:
          {
            results[0].fold((failure) {
              return failure;
            }, (movies) {
              if (movies.isNotEmpty) {
                listing.add(PopularMovies(AppStrings.popularMovies, 0, movies));
              }
            });
          }
        case 1:
          {
            results[1].fold((failure) {
              return failure;
            }, (movies) {
              if (movies.isNotEmpty) {
                listing
                    .add(TopRatedMovies(AppStrings.topRatedMovies, 1, movies));
              }
            });
          }
        case 2:
          {
            results[2].fold((failure) {
              return failure;
            }, (movies) {
              if (movies.isNotEmpty) {
                listing
                    .add(UpcomingMovies(AppStrings.upcomingMovies, 2, movies));
              }
            });
          }
      }
    });

    return Right(listing);
  }
}
