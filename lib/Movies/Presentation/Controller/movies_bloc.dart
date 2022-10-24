import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_popular_movies_usecase.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_top_rated_movies_usecase.dart';
import '../../../Core/UseCase/base_use_case.dart';
import '../../../Core/utilites/enums.dart';
import '../../Domain/UseCases/get_now_playing_movies_usecases.dart';
import 'movies_event.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MoviesBloc(this.getNowPlayingMovies, this.getPopularMovies,
      this.getTopRatedMovies)
      : super(const MoviesStates()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetPopularEvent>(_getPopularMovies);

    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(GetNowPlayingEvent event,
      Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMovies.call(const NoParameters());
    // emit(const MoviesStates(nowPlayingState: RequestState.loaded));
    // if (kDebugMode) {
    //   print(result);
    // }
    result.fold(
            (l) =>
            emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
            (r) =>
            emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            )));
  }


  FutureOr<void> _getPopularMovies(GetPopularEvent event,
      Emitter<MoviesStates> emit) async {
    final result = await getPopularMovies.call(const NoParameters());
    // emit(const MoviesStates(popularState: RequestState.loaded));
    // if (kDebugMode) {
    //   print(result);
    // }
    result.fold(
            (l) =>
            emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
            (r) =>
            emit(state.copyWith(
              popularMovies: r,
              popularState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedEvent event, Emitter<MoviesStates> emit)async {
    final result = await getTopRatedMovies.call(const NoParameters());
    // emit(const MoviesStates(topRatedState: RequestState.loaded));
    // if (kDebugMode) {
    //   print(result);
    // }
    result.fold(
            (l) =>
            emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
            (r) =>
            emit(state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            )));
  }
}