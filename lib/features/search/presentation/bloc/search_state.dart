part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<MovieSearch> movieSearchList;
  final bool hasMoviesListReachedMax;
  final List<TvShowSearch> tvSearchList;
  final bool hasTvShowsListReachedMax;
  final List<PersonSearch> peopleSearchList;
  final bool hasPersonListReachedMax;
  final BlocState searchState;
  final String searchFailMessage;
  final int tabIndex;

  const SearchState({
    this.movieSearchList = const [],
    this.hasMoviesListReachedMax = false,
    this.tvSearchList = const [],
    this.hasTvShowsListReachedMax = false,
    this.peopleSearchList = const [],
    this.hasPersonListReachedMax = false,
    this.searchState = BlocState.initial,
    this.searchFailMessage = '',
    this.tabIndex = 0,
  });

  SearchState copyWith({
    List<MovieSearch>? movieSearchList,
    bool? hasMoviesListReachedMax,
    List<TvShowSearch>? tvSearchList,
    bool? hasTvShowsListReachedMax,
    List<PersonSearch>? personSearchList,
    bool? hasPersonListReachedMax,
    BlocState? searchState,
    String? searchFailMessage,
    int? tabIndex,
  }) {
    return SearchState(
      movieSearchList: movieSearchList ?? this.movieSearchList,
      hasMoviesListReachedMax: hasMoviesListReachedMax ?? this.hasMoviesListReachedMax,
      tvSearchList: tvSearchList ?? this.tvSearchList,
      hasTvShowsListReachedMax: hasTvShowsListReachedMax ?? this.hasTvShowsListReachedMax,
      peopleSearchList: personSearchList ?? this.peopleSearchList,
      hasPersonListReachedMax: hasPersonListReachedMax ?? this.hasPersonListReachedMax,
      searchState: searchState ?? this.searchState,
      searchFailMessage: searchFailMessage ?? this.searchFailMessage,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object?> get props => [
        movieSearchList,
        hasMoviesListReachedMax,
        tvSearchList,
        hasTvShowsListReachedMax,
        peopleSearchList,
        hasPersonListReachedMax,
        searchState,
        searchFailMessage,
        tabIndex,
      ];
}
