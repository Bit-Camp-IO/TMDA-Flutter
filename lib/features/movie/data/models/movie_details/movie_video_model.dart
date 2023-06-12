import 'package:tmda/features/movie/domain/entities/movie_details/movie_video.dart';

class MovieVideoModel extends MovieVideo {
  const MovieVideoModel({
    required super.name,
    required super.key,
    required super.videoType,
  });

  factory MovieVideoModel.fromJson(List<dynamic> movieVideoList) {
    if (movieVideoList.isNotEmpty) {
      return MovieVideoModel(
        name: movieVideoList[0]['name'],
        key: movieVideoList[0]['key'],
        videoType: movieVideoList[0]['type'],
      );
    }else{
      return const MovieVideoModel(
        name: '',
        key: '',
        videoType: '',
      );
    }
  }
}
