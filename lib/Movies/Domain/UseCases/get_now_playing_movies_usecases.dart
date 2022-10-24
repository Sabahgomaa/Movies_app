import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/UseCase/base_use_case.dart';

import '../../../Core/Error/failure.dart';
import '../Entities/Movies.dart';
import '../Repository/base_movies_repository.dart';

class GetNowPlayingMovies extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMovies(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}