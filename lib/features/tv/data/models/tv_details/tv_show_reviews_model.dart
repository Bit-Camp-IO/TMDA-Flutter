import 'package:tmda/features/tv/data/models/tv_details/tv_show_review_owner_model.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_reviews.dart';

class TvShowReviewsModel extends TvShowReviews {
  const TvShowReviewsModel({
    required super.authorName,
    required super.reviewContent,
    required super.reviewUrl,
    required super.reviewOwner,
  });

  factory TvShowReviewsModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowReviewsModel(
      authorName: jsonData['author'],
      reviewContent: jsonData['content'],
      reviewUrl: jsonData['url'],
      reviewOwner: TvShowReviewOwnerModel.fromJson(jsonData['author_details'])
    );
  }
}
