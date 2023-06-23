import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_video.dart';

class TvShowVideoModel extends TvShowVideo {
  const TvShowVideoModel({
    required super.name,
    required super.key,
    required super.videoType,
  });

  factory TvShowVideoModel.fromJson(List<dynamic> tvShowVideosList) {
    if (tvShowVideosList.isNotEmpty) {
      return TvShowVideoModel(
        name: tvShowVideosList[0]['name'],
        key: tvShowVideosList[0]['key'],
        videoType: tvShowVideosList[0]['type'],
      );
    } else {
      return const TvShowVideoModel(
        name: '',
        key: '',
        videoType: '',
      );
    }
  }
}
