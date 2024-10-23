import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation.dart';

 abstract class BaseMovieRepository {
  Future <Either< Failure,List<Movie>>> getNowPlayingMovies();
  Future <Either< Failure,List<Movie>>> getPoplurMovies();
  Future <Either< Failure,List<Movie>>> getRatedMovies();
  Future<Either<Failure , MovieDetail>> getMovieDetails( MovieDetailsParameters parameter);
  Future<Either<Failure , List<Recommendation>>> getRecommedation(RecommendationParameter parameter);
}