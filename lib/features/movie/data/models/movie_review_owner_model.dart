import 'package:tmda/features/movie/domain/entities/movie_review_owner.dart';

class MovieReviewOwnerModel extends MovieReviewOwner {
  const MovieReviewOwnerModel(
      {required super.authorName,
      required super.authorUserName,
      required super.avatarPath,
      required super.rating});

  factory MovieReviewOwnerModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieReviewOwnerModel(
      authorName: jsonData['name'],
      authorUserName: jsonData['username'],
      avatarPath: jsonData['avatar_path'] ?? '',
      rating: jsonData['rating'],
    );
  }
}
