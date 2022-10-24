import 'package:equatable/equatable.dart';

import 'genres_model.dart';

class MoviesDetails extends Equatable{
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int id;
  final int runtime;
  final List<Genres> genres;

  const MoviesDetails(
      {required this.backdropPath,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.id,
      required this.runtime,
      required this.genres});



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}