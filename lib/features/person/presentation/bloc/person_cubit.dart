import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/person/domain/entities/person.dart';
import 'package:equatable/equatable.dart';
import 'package:tmda/features/person/domain/usecases/get_person_details_usecase.dart';

part 'person_state.dart';

@injectable
class PersonCubit extends Cubit<PersonState> {
  final GetPersonDetailsUseCase _getPersonDetailsUseCase;

  PersonCubit(this._getPersonDetailsUseCase) : super(const PersonState());

  Future<void> getPersonDetails(int personId) async {
    await _getPersonDetailsUseCase(personId: personId).then(
      (value) => value.fold(
        (loadDataFailed) => emit(
          state.copyWith(
            personDataLoadFailMessage: loadDataFailed.message,
            personDataState: BlocState.failure,
          ),
        ),
        (personDataLoaded) => emit(
          state.copyWith(
            personDataState: BlocState.success,
            personData: personDataLoaded,
          ),
        ),
      ),
    );
  }
  void changeHeightOnScroll({required double animatedHeight}){
    emit(state.copyWith(animatedHeight: animatedHeight));
  }
  void changeReadMoreState({required bool isTextExpanded}){
    emit(state.copyWith(isTextExpanded: isTextExpanded));
  }
}
