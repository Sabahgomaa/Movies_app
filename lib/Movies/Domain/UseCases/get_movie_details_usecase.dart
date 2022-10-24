import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Error/failure.dart';
import 'package:movies_app/Core/UseCase/base_use_case.dart';
import 'package:movies_app/Movies/Domain/Repository/base_movies_repository.dart';

import '../Entities/movies_details.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MoviesDetails,MovieDetailsParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }

}
class MovieDetailsParameters extends Equatable{
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id,];

}