// ignore_for_file: file_names
import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;

  const Movies({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, backdropPath, overview, genreIds, voteAverage,releaseDate];
//
// @override
// bool operator ==(Object other) =>
//     identical(this, other) ||
//     other is Movies &&
//         runtimeType == other.runtimeType &&
//         id == other.id &&
//         title == other.title &&
//         backdropPath == other.backdropPath &&
//         overview == other.overview &&
//         genreIds == other.genreIds &&
//         voteAverage == other.voteAverage;
//
// @override
// int get hashCode =>
//     id.hashCode ^
//     title.hashCode ^
//     backdropPath.hashCode ^
//     overview.hashCode ^
//     genreIds.hashCode ^
//     voteAverage.hashCode;

}
