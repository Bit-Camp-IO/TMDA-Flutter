import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_review_owner.dart';

class TvShowReviewOwnerModel extends TvShowReviewOwner {
  const TvShowReviewOwnerModel({
    required super.authorName,
    required super.authorUserName,
    required super.avatarPath,
    required super.rating,
  });

  factory TvShowReviewOwnerModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowReviewOwnerModel(
      authorName: jsonData['name'],
      authorUserName: jsonData['username'],
      avatarPath: jsonData['avatar_path'] ?? '',
      rating: jsonData['rating'],
    );
  }
}
