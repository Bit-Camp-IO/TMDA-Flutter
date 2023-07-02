part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<MovieSearch> movieSearchList;
  final bool hasMoviesListReachedMax;
  final List<TvShowSearch> tvSearchList;
  final bool hasTvShowsListReachedMax;
  final List<PersonSearch> personSearchList;
  final bool hasPersonListReachedMax;
  final BlocState searchState;
  final String searchFailMessage;

  const SearchState({
    this.movieSearchList = const [],
    this.hasMoviesListReachedMax = false,
    this.tvSearchList = const [],
    this.hasTvShowsListReachedMax = false,
    this.personSearchList = const [],
    this.hasPersonListReachedMax = false,
    this.searchState = BlocState.initial,
    this.searchFailMessage = '',
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
  }) {
    return SearchState(
      movieSearchList: movieSearchList ?? this.movieSearchList,
      hasMoviesListReachedMax: hasMoviesListReachedMax ?? this.hasMoviesListReachedMax,
      tvSearchList: tvSearchList ?? this.tvSearchList,
      hasTvShowsListReachedMax: hasTvShowsListReachedMax ?? this.hasTvShowsListReachedMax,
      personSearchList: personSearchList ?? this.personSearchList,
      hasPersonListReachedMax: hasPersonListReachedMax ?? this.hasPersonListReachedMax,
      searchState: searchState ?? this.searchState,
      searchFailMessage: searchFailMessage ?? this.searchFailMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieSearchList,
        hasMoviesListReachedMax,
        tvSearchList,
        hasTvShowsListReachedMax,
        personSearchList,
        hasPersonListReachedMax,
        searchState,
        searchFailMessage,
      ];

  
}
