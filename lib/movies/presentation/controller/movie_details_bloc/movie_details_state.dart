import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieDetail,
      this.movieDetailState = RequestState.loading,
      this.movieDetailMessage = '',
      this.recommendation = const [],
      this.recommendationState = RequestState.loading,
      this.recommendationMessage = ''});

  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailMessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailState: movieDetailState ?? this.movieDetailState,
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage);
  }

  @override
  List<Object> get props => [
        movieDetailState,
        movieDetailMessage,
        recommendation,
        recommendationState,
        recommendationMessage
      ];
}

//final class MovieDetailsInitial extends MovieDetailsState {}
