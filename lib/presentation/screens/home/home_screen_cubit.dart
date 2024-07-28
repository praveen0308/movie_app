import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/domain/entity/home_listing_item.dart';
import 'package:movie_app/domain/usecase/get_home_listing.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(this._getHomeListingUseCase) : super(HomeScreenInitial());

  final GetHomeListingUseCase _getHomeListingUseCase;

  Future<void> loadHomeListing() async {
    emit(Loading());
    final result = await _getHomeListingUseCase();

    result.fold((failure) {
      emit(Failed(failure.message));
    }, (items) {
      emit(DataLoaded(items));
    });
  }
}
