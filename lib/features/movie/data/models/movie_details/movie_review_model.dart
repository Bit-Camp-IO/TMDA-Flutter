import 'package:tmda/features/movie/data/models/movie_details/movie_review_owner_model.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_reviews.dart';

class MovieReviewsModel extends MovieReviews {
  const MovieReviewsModel({
    required super.reviewContent,
    required super.reviewUrl,
    required super.movieReviewOwner,
    required super.reviewAuthorName,
  });

  factory MovieReviewsModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieReviewsModel(
      reviewContent: jsonData['content'],
      reviewUrl: jsonData['url'],
      movieReviewOwner: MovieReviewOwnerModel.fromJson(
        jsonData['author_details'],
      ),
      reviewAuthorName: jsonData['author'],
    );
  }
}
