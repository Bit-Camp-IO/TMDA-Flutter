import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_review_owner.dart';

class MovieReviews extends Equatable {
  final String reviewAuthorName;
  final String reviewContent;
  final String reviewUrl;
  final MovieReviewOwner movieReviewOwner;
  const MovieReviews({
    required this.reviewAuthorName,
    required this.reviewContent,
    required this.reviewUrl,
    required this.movieReviewOwner,
  });
  
  @override
  List<Object?> get props => [reviewContent, reviewUrl, movieReviewOwner];
}
