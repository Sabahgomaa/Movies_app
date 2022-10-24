import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/utilites/enums.dart';

import '../../Domain/Entities/movies_details.dart';
import '../../Domain/Entities/recommodation.dart';

class MovieDetailsState extends Equatable {
  final MoviesDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendationDetails;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = '',
      this.recommendationDetails =const [],
      this.recommendationState = RequestState.loading,
      this.recommendationMessage = ''});

  MovieDetailsState copyWith({
    MoviesDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendationDetails,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendationDetails: recommendationDetails ?? this.recommendationDetails,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [movieDetails, movieDetailsState, movieDetailsMessage,recommendationDetails,recommendationMessage,recommendationState];
}
