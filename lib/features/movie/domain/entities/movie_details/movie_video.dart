import 'package:equatable/equatable.dart';

class MovieVideo extends Equatable {
  final String name; 
  final String key;
  final String videoType;
  const MovieVideo({
    required this.name,
    required this.key,
    required this.videoType,
  });
  @override
  List<Object?> get props => [name, key, videoType];
}
