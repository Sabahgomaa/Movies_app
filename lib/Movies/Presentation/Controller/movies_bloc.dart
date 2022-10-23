import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/utilites/enums.dart';
import '../../Domain/UseCases/get_now_playing_movies_usecases.dart';
import 'movies_event.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMovies getNowPlayingMovies;
  MoviesBloc(this.getNowPlayingMovies) : super(const MoviesStates()) {
    on<GrtNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMovies.execute();
      emit(const MoviesStates(nowPlayingState: RequestState.loaded));
      if (kDebugMode) {
        print(result);
      }
      result.fold(
              (l) => emit(MoviesStates(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          )),
              (r) => emit(MoviesStates(
            newPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          )));
    });
  }
}