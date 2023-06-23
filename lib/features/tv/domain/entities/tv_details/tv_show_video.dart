import 'package:equatable/equatable.dart';

class TvShowVideo extends Equatable {
  final String name; 
  final String key;
  final String videoType;
  const TvShowVideo({
    required this.name,
    required this.key,
    required this.videoType,
  });
  @override
  List<Object?> get props => [name, key, videoType];
}
