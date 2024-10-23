import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDeatilsModel extends MovieDetail {
  const MovieDeatilsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage});
  factory MovieDeatilsModel.fromJson(Map<String, dynamic> json) =>
      MovieDeatilsModel(
          backdropPath: json['backdrop_path'] ,
          genres: List<GenresModel>.from(json['genres'].map((x)=>GenresModel.fromjson(x))),
          id: json['id'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          runtime: json['runtime'],
          title: json['title'],
          voteAverage: json["vote_average"].toDouble() );
}
