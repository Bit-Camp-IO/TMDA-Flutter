import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/search/domain/entities/movie_search.dart';
import 'package:tmda/features/search/domain/entities/person_search.dart';
import 'package:tmda/features/search/domain/entities/tv_show_search.dart';
import 'package:tmda/features/search/domain/usecases/add_or_remove_search_content_from_watchlist_usecase.dart';
import 'package:tmda/features/search/domain/usecases/check_for_movie_search_states_usecase.dart';
import 'package:tmda/features/search/domain/usecases/check_for_tv_show_states_search_usecase.dart';
import 'package:tmda/features/search/domain/usecases/get_search_session_id_usecase.dart';
import 'package:tmda/features/search/domain/usecases/search_for_movie_usecase.dart';
import 'package:tmda/features/search/domain/usecases/search_for_person_usecase.dart';
import 'package:tmda/features/search/domain/usecases/search_for_tv_show_usecase.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchSessionIdUseCase _getSessionIdUseCase;
  final SearchForTvShowUseCase _searchForTvShowUseCase;
  final SearchForMovieUseCase _searchForMovieUseCase;
  final SearchForPersonUseCase _searchForPersonUseCase;
  final AddOrRemoveSearchContentFromWatchListUseCase
      _addOrRemoveSearchContentFromWatchListUseCase;
  final CheckForMovieSearchStateUseCase _checkForMovieSearchStateUseCase;
  final CheckForTvShowSearchStateUseCase _checkForTvShowSearchStateUseCase;
  late String sessionId;
  String queryText = '';
  int moviePageNumber = 1;
  int tvShowPageNumber = 1;
  int personPageNumber = 1;

  SearchBloc(
      this._getSessionIdUseCase,
      this._searchForTvShowUseCase,
      this._searchForMovieUseCase,
      this._searchForPersonUseCase,
      this._addOrRemoveSearchContentFromWatchListUseCase,
      this._checkForMovieSearchStateUseCase,
      this._checkForTvShowSearchStateUseCase)
      : super(const SearchState()) {
    on<SearchForMovieEvent>(_searchForMoviesEvent,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 800))
            .distinct()
            .switchMap(mapper));
    on<SearchForTvShowEvent>(_searchForTvShowEvent,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 800))
            .distinct()
            .switchMap(mapper));
    on<SearchForPersonEvent>(_searchForPersonEvent,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 800))
            .distinct()
            .switchMap(mapper));
    on<LoadMoreMoviesEvent>(_loadMoreMoviesEvent, transformer: droppable());
    on<LoadMoreTvShowsEvent>(_loadMoreTvShowsEvent, transformer: droppable());
    on<LoadMorePersonsEvent>(_loadMorePersonsEvent, transformer: droppable());
    on<AddOrRemoveContentFromWatchListEvent>(
        _addOrRemoveContentFromWatchListEvent);
    on<CheckForTappedMovieStatesEvent>(_checkForTappedMovieStatesEvent);
    on<CheckForTappedTvShowStatesEvent>(_checkForTappedTvShowStatesEvent);
    on<CheckForMoviesListStatesEvent>(_checkForMoviesListStatesEvent);
    on<CheckForTvShowsListStatesEvent>(_checkForTvShowsListStatesEvent);
  }

  Future<void> _searchForMoviesEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    if (queryText != event.movieName) {
      queryText = event.movieName;
      moviePageNumber = 1;
      print('>>>$moviePageNumber<<<');
    }
    await _searchForMovieUseCase(
            pageNumber: moviePageNumber,
            movieName: queryText,
            sessionId: sessionId)
        .then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
          ),
        ),
        (movies) {
          if (movies.length == 20) {
            moviePageNumber++;
          }
          return emit(
                  state.copyWith(
                    searchState: BlocState.success,
                    movieSearchList: movies,
                  ),
          );
        },
      ),
    );
  }

  Future<void> _searchForTvShowEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    if (queryText != event.movieName) {
      queryText = event.movieName;
      moviePageNumber = 1;
    }
    await _searchForTvShowUseCase(
            pageNumber: moviePageNumber,
            tvShowName: queryText,
            sessionId: sessionId)
        .then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
          ),
        ),
        (tvShow) {
          if (tvShow.length == 20) {
            moviePageNumber++;
          }
          return emit(state.copyWith(
            searchState: BlocState.success,
            tvSearchList: tvShow,
          ));
        },
      ),
    );
  }

  Future<void> _searchForPersonEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    if (queryText != event.movieName) {
      queryText = event.movieName;
      moviePageNumber = 1;
    }
    await _searchForPersonUseCase(
            pageNumber: moviePageNumber,
            personName: queryText,
            sessionId: sessionId)
        .then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
          ),
        ),
        (personList) {
          if (personList.length == 20) {
            moviePageNumber++;
          }
          return emit(state.copyWith(
            searchState: BlocState.success,
            personSearchList: personList,
          ));
        },
      ),
    );
  }

  Future<void> _loadMoreMoviesEvent(event, emit) async {}

  Future<void> _loadMoreTvShowsEvent(event, emit) async {}

  Future<void> _loadMorePersonsEvent(event, emit) async {}

  Future<void> _addOrRemoveContentFromWatchListEvent(event, emit) async {}

  Future<void> _checkForTappedMovieStatesEvent(event, emit) async {}

  Future<void> _checkForTappedTvShowStatesEvent(event, emit) async {}

  Future<void> _checkForMoviesListStatesEvent(event, emit) async {}

  Future<void> _checkForTvShowsListStatesEvent(event, emit) async {}
}
