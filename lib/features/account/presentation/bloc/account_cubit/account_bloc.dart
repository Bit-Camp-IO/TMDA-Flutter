import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/entities/account_avatar.dart';
import 'package:tmda/features/account/domain/usecases/account/account_logout_usecase.dart';
import 'package:tmda/features/account/domain/usecases/account/get_account_details_usecase.dart';
import 'package:tmda/features/shared/domain/usecases/get_session_id_usecase.dart';

part 'account_state.dart';

@Injectable()
class AccountCubit extends Cubit<AccountState> {
  final GetSessionIdUseCase _getSessionIdUseCase;
  final GetAccountDetailsUseCase _getAccountDetailsUseCase;
  final AccountLogoutUseCase _accountLogoutUseCase;
  late String _sessionId;

  AccountCubit(
    this._getAccountDetailsUseCase,
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
