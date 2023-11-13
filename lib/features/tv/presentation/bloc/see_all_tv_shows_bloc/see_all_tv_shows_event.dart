part of 'see_all_tv_shows_bloc.dart';

abstract class SeeAllTvShowsEvent extends Equatable {
  const SeeAllTvShowsEvent();
  @override
  List<Object?> get props => [];
}

class GetAllAiringTodayTvShowsEvent extends SeeAllTvShowsEvent {}

class GetAllPopularTvShowsEvent extends SeeAllTvShowsEvent {}

class GetAllTopRatedTvShowsEvent extends SeeAllTvShowsEvent {}

class GetAllRecommendedTvShowsEvent extends SeeAllTvShowsEvent {
  final int tvShowId;
  const GetAllRecommendedTvShowsEvent({
    required this.tvShowId,
  });
  @override
  List<Object?> get props => [tvShowId];
}

class GetAllSimilarTvShowsEvent extends SeeAllTvShowsEvent {
  final int tvShowId;
  const GetAllSimilarTvShowsEvent({
    required this.tvShowId,
  });
  @override
  List<Object?> get props => [tvShowId];
}