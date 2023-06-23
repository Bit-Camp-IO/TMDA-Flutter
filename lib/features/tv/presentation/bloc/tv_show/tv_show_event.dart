part of 'tv_show_bloc.dart';

abstract class TvShowsEvent extends Equatable {
  const TvShowsEvent();

  @override
  List<Object> get props => [];
}

class GetTvShowsAiringTodayEvent extends TvShowsEvent{}

class GetTvShowsAiringThisWeekEvent extends TvShowsEvent{}

class GetPopularTvShowsEvent extends TvShowsEvent {}

class GetTopRatedTvShowsEvent extends TvShowsEvent {}
