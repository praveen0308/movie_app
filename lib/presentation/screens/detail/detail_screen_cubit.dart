import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/entity/video_entity.dart';
import 'package:movie_app/domain/usecase/get_movie_detail.dart';

part 'detail_screen_state.dart';

class DetailScreenCubit extends Cubit<DetailScreenState> {
  DetailScreenCubit(this._getMovieDetail) : super(DetailScreenInitial());

  final GetMovieDetail _getMovieDetail;

  Future<void> loadMovieDetail(int movieId) async {
    emit(LoadingDetails());
    final result = await _getMovieDetail(movieId);

    result.fold((failure) {
      emit(Error(failure.message));
    }, (data) {
      emit(ReceivedDetails(data, data.getTrailerVideo()));
    });
  }
}
