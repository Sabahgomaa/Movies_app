import 'package:equatable/equatable.dart';

import '../../../Core/utilites/enums.dart';
import '../../domain/Entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movies> newPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  const MoviesStates(
      {this.newPlayingMovies = const [],
        this.nowPlayingState = RequestState.loading,
        this.nowPlayingMessage = ''});

  @override
  // TODO: implement props
  List<Object?> get props => [newPlayingMovies,nowPlayingState,nowPlayingMessage];
}
