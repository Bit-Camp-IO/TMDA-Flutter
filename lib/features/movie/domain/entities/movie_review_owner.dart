import 'package:equatable/equatable.dart';

class MovieReviewOwner extends Equatable {
  final String authorName;
  final String authorUserName;
  final String avatarPath;
  final dynamic rating;
  const MovieReviewOwner( {
    required this.authorName,
    required this.authorUserName,
    required this.avatarPath,
    required this.rating
  });
  
  @override
  List<Object?> get props => [authorName, authorUserName, avatarPath, rating];
}
