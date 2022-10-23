import 'package:dartz/dartz.dart';
import '../../../Core/Error/failure.dart';
import '../Entities/Movies.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure,List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movies>>>getPopularMovies();

  Future<Either<Failure,List<Movies>>> getTopRatedMovies();
}
