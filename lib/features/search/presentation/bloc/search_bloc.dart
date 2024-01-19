import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/search/domain/entities/movie_search.dart';
import 'package:tmda/features/search/domain/entities/person_search.dart';
import 'package:tmda/features/search/domain/entities/tv_show_search.dart';
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
  String movieSearchInput = '';
  String tvSearchInput = '';
  String personSearchInput = '';
  int _moviePageNumber = 1;
  int _tvShowPageNumber = 1;
  int _personPageNumber = 1;

  SearchBloc(
    this._getSessionIdUseCase,
    this._searchForTvShowUseCase,
    this._searchForMovieUseCase,
    this._searchForPersonUseCase,
  ) : super(const SearchState()) {
    on<SearchForMovieEvent>(_searchForMoviesEvent,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 1000))
            .distinct()
            .switchMap(mapper));
    on<SearchForTvShowEvent>(_searchForTvShowEvent,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 1000))
            .distinct()
            .switchMap(mapper));
    on<SearchForPersonEvent>(_searchForPersonEvent,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 1000))
            .distinct()
            .switchMap(mapper));
    on<LoadMoreMoviesEvent>(_loadMoreMoviesEvent, transformer: droppable());
    on<LoadMoreTvShowsEvent>(_loadMoreTvShowsEvent, transformer: droppable());
    on<LoadMorePersonsEvent>(_loadMorePersonsEvent, transformer: droppable());
    on<RetryMovieSearchEvent>(_retryMovieSearchEvent, transformer: droppable());
    on<RetryTvShowSearchEvent>(_retryTvShowSearchEvent, transformer: droppable());
    on<RetryPersonSearchEvent>(_retryPersonSearchEvent, transformer: droppable());
    on<ChangeSearchTabEvent>(_changeSearchTabEvent);
  }

  Future<void> _searchForMoviesEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    movieSearchInput = event.movieName;
    _moviePageNumber = 1;
    await _searchForMovieUseCase(
      pageNumber: _moviePageNumber,
      movieName: movieSearchInput,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
            movieSearchList: []
          ),
        ),
        (movies) {
          _moviePageNumber++;
           emit(
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
    tvSearchInput = event.tvShowName;
    _tvShowPageNumber = 1;
    emit(state.copyWith(hasMoviesListReachedMax: false));
    await _searchForTvShowUseCase(
      pageNumber: _tvShowPageNumber,
      tvShowName: tvSearchInput,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
            tvSearchList: []
          ),
        ),
        (tvShow) {
          _tvShowPageNumber++;
           emit(
            state.copyWith(
              searchState: BlocState.success,
              tvSearchList: tvShow,
            ),
          );
        },
      ),
    );
  }

  Future<void> _searchForPersonEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    personSearchInput = event.personName;
    _personPageNumber = 1;
    await _searchForPersonUseCase(
      pageNumber: _personPageNumber,
      personName: personSearchInput,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
            peopleSearchList: [],
          ),
        ),
        (personList) {
          _personPageNumber++;
          emit(state.copyWith(
            searchState: BlocState.success,
            peopleSearchList: personList,
          ));
        },
      ),
    );
  }

  Future<void> _loadMoreMoviesEvent(event, emit) async {
    final String sessionId = await _getSessionIdUseCase();
    if (state.hasMoviesListReachedMax == false) {
      await _searchForMovieUseCase(
        pageNumber: _moviePageNumber,
        movieName: movieSearchInput,
        sessionId: sessionId,
      ).then(
        (value) => value.fold(
          (loadDataFail) => emit(
            state.copyWith(
              searchFailMessage: loadDataFail.message,
              searchState: BlocState.failure,
            ),
          ),
          (movies) {
            if (movies.isEmpty) {
              emit(
                state.copyWith(
                  searchState: BlocState.success,
                  hasMoviesListReachedMax: true,
                ),
              );
            } else {
              _moviePageNumber++;
              emit(
                state.copyWith(
                  searchState: BlocState.success,
                  movieSearchList: List.of(state.movieSearchList)
                    ..addAll(movies),
                  hasPersonListReachedMax: false,
                ),
              );
            }
          },
        ),
      );
    }
  }

  Future<void> _loadMoreTvShowsEvent(event, emit) async {
    final String sessionId = await _getSessionIdUseCase();
    if (state.hasTvShowsListReachedMax == false) {
      await _searchForTvShowUseCase(
        pageNumber: _tvShowPageNumber,
        tvShowName: tvSearchInput,
        sessionId: sessionId,
      ).then(
        (value) => value.fold(
          (loadDataFail) => emit(
            state.copyWith(
              searchFailMessage: loadDataFail.message,
              searchState: BlocState.failure,
            ),
          ),
          (tvShows) {
            if (tvShows.isEmpty) {
               emit(
                state.copyWith(
                  searchState: BlocState.success,
                  hasMoviesListReachedMax: true,
                ),
              );
            } else {
              _tvShowPageNumber++;
              emit(
                state.copyWith(
                  searchState: BlocState.success,
                  tvSearchList: List.of(state.tvSearchList)..addAll(tvShows),
                  hasPersonListReachedMax: false,
                ),
              );
            }
          },
        ),
      );
    }
  }

  Future<void> _loadMorePersonsEvent(event, emit) async {
    final String sessionId = await _getSessionIdUseCase();
    if (state.hasPersonListReachedMax == false) {
      await _searchForPersonUseCase(
        pageNumber: _personPageNumber,
        personName: personSearchInput,
        sessionId: sessionId,
      ).then(
        (value) => value.fold(
          (loadDataFail) => emit(
            state.copyWith(
              searchFailMessage: loadDataFail.message,
              searchState: BlocState.failure,
            ),
          ),
          (people) {
            if (people.isEmpty) {
              emit(
                state.copyWith(
                  searchState: BlocState.success,
                  hasPersonListReachedMax: true,
                ),
              );
            } else {
              _personPageNumber++;
              emit(
                state.copyWith(
                  searchState: BlocState.success,
                  peopleSearchList: List.of(state.peopleSearchList)
                    ..addAll(people),
                  hasPersonListReachedMax: false,
                ),
              );
            }
          },
        ),
      );
    }
  }

  Future<void> _retryPersonSearchEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    await _searchForPersonUseCase(
      pageNumber: _personPageNumber,
      personName: personSearchInput,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
          ),
        ),
        (personList) {
          _personPageNumber++;
          emit(state.copyWith(
            searchState: BlocState.success,
            peopleSearchList: personList,
          ));
        },
      ),
    );
  }

  Future<void> _retryMovieSearchEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    await _searchForMovieUseCase(
      pageNumber: _moviePageNumber,
      movieName: movieSearchInput,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
          ),
        ),
        (movies) {
          _moviePageNumber++;
          emit(
            state.copyWith(
              searchState: BlocState.success,
              movieSearchList: movies,
            ),
          );
        },
      ),
    );
  }

  Future<void> _retryTvShowSearchEvent(event, emit) async {
    emit(state.copyWith(searchState: BlocState.loading));
    final String sessionId = await _getSessionIdUseCase();
    await _searchForTvShowUseCase(
      pageNumber: _tvShowPageNumber,
      tvShowName: tvSearchInput,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (loadDataFail) => emit(
          state.copyWith(
            searchFailMessage: loadDataFail.message,
            searchState: BlocState.failure,
          ),
        ),
        (tvShow) {
          _tvShowPageNumber++;
          emit(
            state.copyWith(
              searchState: BlocState.success,
              tvSearchList: tvShow,
            ),
          );
        },
      ),
    );
  }

  void _changeSearchTabEvent(event, emit) {
    emit(state.copyWith(tabIndex: event.tabIndex));
  }
}
