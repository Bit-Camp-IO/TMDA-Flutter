import 'package:equatable/equatable.dart';

class SeasonEpisode extends Equatable {
  final String name;
  final String posterPath;
  final String airDate;
  final int number;
  final int id;
  final int voteCount;
  final int runTime;
  
  final dynamic voteAverage;
  const SeasonEpisode({
    required this.name,
    required this.posterPath,
    required this.airDate, 
    required this.number,
    required this.id,
    required this.voteCount,
    required this.voteAverage,
    required this.runTime, 
  });

  @override
  List<Object?> get props => [
        id,
        name,
        number,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
