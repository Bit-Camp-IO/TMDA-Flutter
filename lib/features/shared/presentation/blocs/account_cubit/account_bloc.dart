import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/entities/account_avatar.dart';
import 'package:tmda/features/account/domain/entities/watchlist_movie.dart';
import 'package:tmda/features/account/domain/entities/watchlist_tv_show.dart';
import 'package:tmda/features/account/domain/usecases/account/account_logout_usecase.dart';
import 'package:tmda/features/account/domain/usecases/account/get_account_details_usecase.dart';
import 'package:tmda/features/account/domain/usecases/account_movies_watchlist/get_movies_watchlist_usecase.dart';
import 'package:tmda/features/account/domain/usecases/account_tv_shows_watchlist/get_tv_shows_watchlist_usecase.dart';
import 'package:tmda/features/shared/domain/usecases/get_session_id_usecase.dart';

part 'account_state.dart';

@Injectable()
class AccountCubit extends Cubit<AccountState> {
  final GetSessionIdUseCase _getSessionIdUseCase;
  final GetAccountDetailsUseCase _getAccountDetailsUseCase;
  final GetMoviesWatchListUseCase _getMoviesWatchListUseCase;
  final GetTvShowsWatchListUseCase _getTvShowsWatchListUseCase;
  final AccountLogoutUseCase _accountLogoutUseCase;
  late String _sessionId;

  AccountCubit(
    this._getAccountDetailsUseCase,
    this._getMoviesWatchListUseCase,
    this._getTvShowsWatchListUseCase,
    this._accountLogoutUseCase,
    this._getSessionIdUseCase,
  ) : super(const AccountState());

  Future<void> getAccountDetails() async {
    await _getAccountDetailsUseCase().then(
      (value) => value.fold(
        (accountDetailsFail) => emit(
          state.copyWith(
            accountTabState: BlocState.failure,
            accountFailMessage: accountDetailsFail.message,
          ),
        ),
        (accountDetails) => emit(
          state.copyWith(
            accountTabState: BlocState.success,
            account: accountDetails,
          ),
        ),
      ),
    );
  }

  Future<void> getAccountMoviesWatchList() async {
    await _getMoviesWatchListUseCase().then(
      (value) => value.fold(
        (watchlistFail) => emit(
          state.copyWith(
            accountTabState: BlocState.failure,
            accountFailMessage: watchlistFail.message,
          ),
        ),
        (watchListMovies) => emit(
          state.copyWith(
            moviesWatchListState: BlocState.success,
            watchListMovies: watchListMovies,
          ),
        ),
      ),
    );
  }

  Future<void> getAccountTvShowsWatchList() async {
    await _getTvShowsWatchListUseCase().then(
      (value) => value.fold(
        (watchlistFail) => emit(
          state.copyWith(
            accountTabState: BlocState.failure,
            accountFailMessage: watchlistFail.message,
          ),
        ),
        (watchListTvShows) => emit(
          state.copyWith(
            moviesWatchListState: BlocState.success,
            watchListTvShows: watchListTvShows,
          ),
        ),
      ),
    );
  }

  Future<void> accountLogout() async {
    _sessionId = await _getSessionIdUseCase();
    await _accountLogoutUseCase(sessionId: _sessionId).then(
      (value) => value.fold(
        (accountLogout) => emit(
          state.copyWith(
            userAccountState: UserAccountState.fail,
            accountFailMessage: accountLogout.message,
          ),
        ),
        (logout) => emit(
          state.copyWith(
            userAccountState: UserAccountState.loggedOut,
          ),
        ),
      ),
    );
  }
}
