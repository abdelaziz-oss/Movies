import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingRequest;
  final String nowPlayingMoviesMessage;
  final List<Movie> popularMovies;
  final RequestState popularRequest;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedRequest;
  final String topRatedMessage;

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingRequest,
        nowPlayingMoviesMessage,
        popularMovies,
        popularRequest,
        popularMessage,
        topRatedMovies,
        topRatedRequest,
        topRatedMessage
      ];

  const MovieState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingRequest = RequestState.loading,
      this.nowPlayingMoviesMessage = '',
      this.popularMovies = const [],
      this.popularRequest = RequestState.loading,
      this.popularMessage = '',
      this.topRatedMovies=const[] ,
      this.topRatedRequest=RequestState.loading,
      this.topRatedMessage=''});
  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingRequest,
    String? nowPlayingMoviesMessage,
    List<Movie>? popularMovies,
    RequestState? popularRequest,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedRequest,
    String? topRatedMessage,

  }) {
    return MovieState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingRequest: nowPlayingRequest ?? this.nowPlayingRequest,
        nowPlayingMoviesMessage: this.nowPlayingMoviesMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularRequest: popularRequest ?? this.popularRequest,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedRequest: topRatedRequest ?? this.topRatedRequest,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage
        );
  }
}
