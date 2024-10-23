// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_poplur_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPoplurMoviesUseCase getPoplurMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPoplurMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovies);
    on<GetPoplurMovieEvent>(_getPopluarMovies);
    on<GetTopRatedMovieEvent>(_getTopRatedMovie);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMovieEvent event, Emitter<MovieState> emit) async {
     final result = await getNowPlayingMoviesUseCase(const NoParameter());
      //emit(const MovieState(nowPlayingRequest: RequestState.loaded));
      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingRequest: RequestState.error,
              nowPlayingMoviesMessage: l.message)),
          (r) => emit(state.copyWith(
              nowPlayingMovies: r, nowPlayingRequest: RequestState.loaded)));
  }

  FutureOr<void> _getPopluarMovies(GetPoplurMovieEvent event, Emitter<MovieState> emit) async{
    final result = await getPoplurMoviesUseCase(const NoParameter());
      //emit(const MovieState(popularRequest: RequestState.loaded));
      result.fold(
          (l) => emit(state.copyWith(
              popularRequest: RequestState.error, popularMessage: l.message)),
          (r) => emit(state.copyWith(
              popularMovies: r, popularRequest: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovie(GetTopRatedMovieEvent event, Emitter<MovieState> emit)async {
    final result = await getTopRatedMoviesUseCase(const NoParameter());
    print(16);
    result.fold(
      (l) => emit(state.copyWith(topRatedRequest: RequestState.error , topRatedMessage: l.message)),
      (r)=> emit(state.copyWith(topRatedMovies: r , topRatedRequest: RequestState.loaded))
      );

  }
}
