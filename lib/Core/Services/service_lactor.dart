import 'package:get_it/get_it.dart';
import '../../Movies/Data/Repository/movies_repository.dart';
import '../../Movies/Data/dataSource/movies_remota_data_source.dart';
import '../../Movies/Domain/Repository/base_movies_repository.dart';
import '../../Movies/Domain/UseCases/get_now_playing_movies_usecases.dart';
import '../../Movies/Presentation/Controller/movies_bloc.dart';

final sl =GetIt.instance;
class ServicesLocator{
  void init(){
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    ///Use Case
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    ///Data Sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}