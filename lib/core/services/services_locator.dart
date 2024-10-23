import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_poplur_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_rated_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator {
void init(){
  sl.registerFactory(()=> MovieBloc(sl() , sl(),sl()));
  sl.registerFactory(()=>MovieDetailsBloc(sl(),sl()));
  ///NowPlayingMoviesUseCase
  sl.registerLazySingleton(()=>GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetPoplurMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(()=>GetRecommendationUsecase(sl()));

  ///Repository
  sl.registerLazySingleton<BaseMovieRepository>(()=>MovieRepository(sl()));
    ///DATA SOURCE 
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(()=> MovieRemoteDataSource());

}


  

}