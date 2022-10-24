import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/Domain/Entities/movies_details.dart';
import 'package:movies_app/Movies/Domain/Entities/recommodation.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_recommendation_usecase.dart';
import '../../../Core/Error/expection.dart';
import '../../../Core/Error/failure.dart';
import '../../Domain/Entities/Movies.dart';
import '../../Domain/Repository/base_movies_repository.dart';
import '../../Domain/UseCases/get_movie_details_usecase.dart';
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
    final result= await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getTopRatedMovies() async{
    final result= await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,MoviesDetails>> getMoviesDetails(MovieDetailsParameters parameters) async{
    final result= await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result= await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}