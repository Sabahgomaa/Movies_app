import 'package:dartz/dartz.dart';
import '../../../Core/Error/failure.dart';
import '../Entities/Movies.dart';
import '../Repository/base_movies_repository.dart';

class GetPopularMovies{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMovies(this.baseMoviesRepository);
  Future<Either<Failure,List<Movies>>>  execute () async{
    return await baseMoviesRepository.getPopularMovies();
  }
}