import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_popular_movies_usecase.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_recommendation_usecase.dart';
import 'package:movies_app/Movies/Domain/UseCases/get_top_rated_movies_usecase.dart';
import '../../Movies/Data/Repository/movies_repository.dart';
import '../../Movies/Data/dataSource/movies_remota_data_source.dart';
import '../../Movies/Domain/Repository/base_movies_repository.dart';
import '../../Movies/Domain/UseCases/get_movie_details_usecase.dart';
import '../../Movies/Domain/UseCases/get_now_playing_movies_usecases.dart';
import '../../Movies/Presentation/Controller/movie_details_bloc.dart';
import '../../Movies/Presentation/Controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    ///Use Case
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
