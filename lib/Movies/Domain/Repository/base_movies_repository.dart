import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_movie_details_usecase.dart';
import '../../../Core/Error/failure.dart';
import '../Entities/Movies.dart';
import '../Entities/movies_details.dart';
import '../Entities/recommodation.dart';
import '../UseCases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
