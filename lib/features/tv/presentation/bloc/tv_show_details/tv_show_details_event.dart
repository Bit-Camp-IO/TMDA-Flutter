part of 'tv_show_details_bloc.dart';

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
class GetTvShowStatesEvent extends TvDetailsEvent {
  final int tvShowId;

  const GetTvShowStatesEvent({required this.tvShowId});

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


class OnScrollAnimationEvent extends TvDetailsEvent {
  final double animatedHeight;

  const OnScrollAnimationEvent({required this.animatedHeight});
}
