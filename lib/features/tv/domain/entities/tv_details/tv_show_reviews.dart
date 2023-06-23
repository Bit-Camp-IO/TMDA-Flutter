import 'package:equatable/equatable.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_review_owner.dart';

class TvShowReviews extends Equatable {
  final String authorName;
  final String reviewContent;
  final String reviewUrl;
  final TvShowReviewOwner reviewOwner;
  const TvShowReviews({
    required this.authorName,
    required this.reviewContent,
    required this.reviewUrl,
    required this.reviewOwner
  });
  
  @override
  List<Object?> get props => [reviewContent, reviewUrl, authorName, reviewOwner];
}
