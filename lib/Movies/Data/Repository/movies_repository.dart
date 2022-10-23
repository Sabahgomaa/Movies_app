import 'package:dartz/dartz.dart';

import '../../../Core/Error/expection.dart';
import '../../../Core/Error/failure.dart';
import '../../Domain/Entities/Movies.dart';
import '../../Domain/Repository/base_movies_repository.dart';
import '../dataSource/movies_remota_data_source.dart';


class MovieRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movies>>> getNowPlayingMovies() async{
    final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getPopularMovies() async{
    final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getTopRatedMovies() async{
    final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}