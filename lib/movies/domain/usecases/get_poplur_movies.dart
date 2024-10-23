import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
 
class GetPoplurMoviesUseCase extends BaseUsecase<List<Movie> , NoParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetPoplurMoviesUseCase(this.baseMovieRepository);
  @override
   Future <Either< Failure,List<Movie>>>  call(NoParameter parameter)async{
    return await baseMovieRepository.getPoplurMovies();
  }

}