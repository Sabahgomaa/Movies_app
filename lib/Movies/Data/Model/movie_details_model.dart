import 'package:movies_app/Movies/Domain/Entities/movies_details.dart';

import 'genres_model.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel(
      {required super.backdropPath,
      required super.overview,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.id,
      required super.runtime,
      required super.genres});

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(
            json['genres'].map((e) => GenresModel.fromJson(e))),
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
