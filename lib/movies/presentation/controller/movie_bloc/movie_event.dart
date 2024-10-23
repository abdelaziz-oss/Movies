import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent(); 
  @override
  List<Object?> get props => [];
  
}
class GetNowPlayingMovieEvent extends MovieEvent{}
class GetPoplurMovieEvent extends MovieEvent{} 
class GetTopRatedMovieEvent extends MovieEvent{}