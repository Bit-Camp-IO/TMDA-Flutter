part of 'person_cubit.dart';

class PersonState extends Equatable {
  final Person personData;
  final BlocState personDataState;
  final String personDataLoadFailMessage;
  const PersonState({
    this.personData = const Person(
      name: '',
      biography: '',
      id: 0,
      birthDay: '',
      knowingFor: '',
      movies: [],
      placeOfBirth: '',
      profilePath: '',
      tvShows: [],
    ),
  this.personDataState = BlocState.loading,
    this.personDataLoadFailMessage = '',
  });

  PersonState copyWith({
    Person? personData,
    BlocState? personDataState,
    String? personDataLoadFailMessage,
    double? animatedHeight,
    bool? isTextExpanded
  }) {
    return PersonState(
      personData: personData ?? this.personData,
      personDataState: personDataState ?? this.personDataState,
      personDataLoadFailMessage: personDataLoadFailMessage ?? this.personDataLoadFailMessage,
    );
  }

  @override
  List<Object> get props => [personData, personDataLoadFailMessage, personDataState];

}
