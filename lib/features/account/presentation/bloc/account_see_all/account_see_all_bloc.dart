import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_see_all_event.dart';
part 'account_see_all_state.dart';

class AccountSeeAllBloc extends Bloc<AccountSeeAllEvent, AccountSeeAllState> {
  AccountSeeAllBloc() : super(AccountSeeAllInitial()) {
    on<AccountSeeAllEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
