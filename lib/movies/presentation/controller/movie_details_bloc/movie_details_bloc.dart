import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase , this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommedation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUsecase getRecommendationUsecase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailState: RequestState.error,
            movieDetailMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetailState: RequestState.loaded, movieDetail: r)));
  }

  FutureOr<void> _getRecommedation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
    final result =
        await getRecommendationUsecase(RecommendationParameter(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendationState: RequestState.loaded, recommendation: r)));
  }
}
