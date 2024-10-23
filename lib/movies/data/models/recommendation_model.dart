import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({ super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(backdropPath: json['backdrop_path'] ?? '/bAO9hLGRWOJMUFXmKwa4kST6I5N.jpg', id: json['id']);
}
