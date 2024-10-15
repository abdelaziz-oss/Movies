import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_poplur_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator {
void init(){
  sl.registerFactory(()=> MovieBloc(sl() , sl(),sl()));
  ///NowPlayingMoviesUseCase
  sl.registerLazySingleton(()=>GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetPoplurMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetTopRatedMoviesUseCase(sl()));

  ///Repository
  sl.registerLazySingleton<BaseMovieRepository>(()=>MovieRepository(sl()));
    ///DATA SOURCE 
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(()=> MovieRemoteDataSource());

}


  

}