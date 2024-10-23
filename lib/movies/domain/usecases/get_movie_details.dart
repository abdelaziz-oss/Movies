
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUsecase<MovieDetail , MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameter)  async{
    return  await baseMovieRepository.getMovieDetails(parameter);
  }
}
class MovieDetailsParameters extends Equatable{
  final int movieId;
const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}