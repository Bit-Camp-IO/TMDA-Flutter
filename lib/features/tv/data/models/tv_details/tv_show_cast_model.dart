import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_cast.dart';

class TvShowCastModel extends TvShowCast {
  const TvShowCastModel({
    required super.actorId,
    required super.actorName,
    required super.movieCharacter,
    required super.actorPicPath,
  });

  factory TvShowCastModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowCastModel(
      actorId: jsonData['id'],
      actorName: jsonData['name'],
      movieCharacter: jsonData['character'],
      actorPicPath: jsonData['profile_path'] ?? '',
    );
  }
}
