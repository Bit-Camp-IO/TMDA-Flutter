part of 'tv_details_bloc.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetTvShowDetailsEvent extends TvDetailsEvent {
  final int tvShowId;

  const GetTvShowDetailsEvent(this.tvShowId);

  @override
  List<Object> get props => [tvShowId];
}

class GetTvShowCastEvent extends TvDetailsEvent {
  final int tvShowId;

  const GetTvShowCastEvent(this.tvShowId);

  @override
  List<Object> get props => [tvShowId];
}

class GetMoreSimilarTvShowsEvent extends TvDetailsEvent {
  final int tvShowId;

  const GetMoreSimilarTvShowsEvent(this.tvShowId);

  @override
  List<Object> get props => [tvShowId];
}

class GetMoreRecommendedTvShowsEvent extends TvDetailsEvent {
  final int tvShowId;

  const GetMoreRecommendedTvShowsEvent(this.tvShowId);

  @override
  List<Object> get props => [tvShowId];
}

class GetTvShowReviewsEvent extends TvDetailsEvent {
  final int tvShowId;

  const GetTvShowReviewsEvent(this.tvShowId);

  @override
  List<Object> get props => [tvShowId];
}

class PlayTvShowVideoEvent extends TvDetailsEvent {
  final String videoKey;

  const PlayTvShowVideoEvent(this.videoKey);

  @override
  List<Object> get props => [videoKey];
}

class AddOrRemoveTvFromWatchListEvent extends TvDetailsEvent {
  final bool isInWatchList;
  final int tvShowId;

  const AddOrRemoveTvFromWatchListEvent(
      {required this.isInWatchList, required this.tvShowId});

  @override
  List<Object> get props => [isInWatchList, tvShowId];
}

class GetSeasonEpisodesEvent extends TvDetailsEvent {
  final int tvShowId;

  const GetSeasonEpisodesEvent({
    required this.tvShowId,
  });

  @override
  List<Object> get props => [tvShowId];
}

class ChangeBodyTabsIndexEvent extends TvDetailsEvent {
  final int bodyTabIndex;

  const ChangeBodyTabsIndexEvent(this.bodyTabIndex);

  @override
  List<Object> get props => [bodyTabIndex];
}

class ChangeSeasonsTabsIndexEvent extends TvDetailsEvent {
  final int seasonsTabIndex;

  const ChangeSeasonsTabsIndexEvent(this.seasonsTabIndex);

  @override
  List<Object> get props => [seasonsTabIndex];
}

class OnScrollAnimationEvent extends TvDetailsEvent {
  final double animatedHeight;

  const OnScrollAnimationEvent({required this.animatedHeight});
}
