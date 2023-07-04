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
import 'package:tmda/features/account/domain/usecases/get_account_session_id_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

@Injectable()
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetAccountSessionIdUseCase getAccountSessionIdUseCase;
  final GetAccountDetailsUseCase getAccountDetailsUseCase;
  final GetMoviesWatchListUseCase getMoviesWatchListUseCase;
  final GetTvShowsWatchListUseCase getTvShowsWatchListUseCase;
  final AccountLogoutUseCase accountLogoutUseCase;
  late String sessionId;

  AccountBloc(
    this.getAccountDetailsUseCase,
    this.getMoviesWatchListUseCase,
    this.getTvShowsWatchListUseCase,
    this.accountLogoutUseCase,
    this.getAccountSessionIdUseCase,
  ) : super(const AccountState()) {
    on<GetAccountDetailsEvent>(_getAccountDetailsEvent);
    on<GetAccountMoviesWatchListEvent>(_getAccountMoviesWatchListEvent);
    on<GetAccountTvShowsWatchListEvent>(_getAccountTvShowsWatchListEvent);
    on<AccountLogoutEvent>(_accountLogoutEvent);
  }

  Future<void> _getAccountDetailsEvent(event, emit) async {
    sessionId = await getAccountSessionIdUseCase();
    await getAccountDetailsUseCase(sessionId: sessionId).then(
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

  Future<void> _getAccountMoviesWatchListEvent(event, emit) async {
    sessionId = await getAccountSessionIdUseCase();
    await getMoviesWatchListUseCase(sessionId: sessionId).then(
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

  Future<void> _getAccountTvShowsWatchListEvent(event, emit) async {
    sessionId = await getAccountSessionIdUseCase();
    await getTvShowsWatchListUseCase(sessionId: sessionId).then(
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

  Future<void> _accountLogoutEvent(event, emit) async {
    await accountLogoutUseCase(sessionId: sessionId).then(
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
