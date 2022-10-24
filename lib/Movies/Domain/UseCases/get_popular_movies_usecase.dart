import 'package:dartz/dartz.dart';
import '../../../Core/Error/failure.dart';
import '../../../Core/UseCase/base_use_case.dart';
import '../Entities/Movies.dart';
import '../Repository/base_movies_repository.dart';

class GetPopularMovies extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMovies(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }
}