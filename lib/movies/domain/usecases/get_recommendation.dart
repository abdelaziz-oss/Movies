import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationUsecase
    extends BaseUsecase<List<Recommendation>, RecommendationParameter> {
      final BaseMovieRepository baseMovieRepository;

  GetRecommendationUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameter parameter)async {
    return await baseMovieRepository.getRecommedation(parameter);
  }}

class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter(this.id);

  @override
  List<Object?> get props => [id];
}
