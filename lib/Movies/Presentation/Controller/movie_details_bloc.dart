import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_recommendation_usecase.dart';

import '../../../Core/utilites/enums.dart';
import '../../Domain/UseCases/get_movie_details_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_states.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviesDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEventEvent>(_getRecommendation);
  }

  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMoviesDetailsUseCase(MovieDetailsParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetails: r,
              movieDetailsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEventEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
    await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
            (l) => emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          recommendationDetails: r,
          recommendationState: RequestState.loaded,
        )));
  }
}
