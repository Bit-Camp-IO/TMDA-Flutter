// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tmda/features/movie/domain/entities/movie_details.dart';
import 'package:tmda/features/movie/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsCubit(this.getMovieDetailsUseCase)
      : super(MovieDetailsInitialState());

  Future<void> getMovieDetails(String movieId) async {
    emit(MovieDetailsLoadingState());
    final result = await getMovieDetailsUseCase(movieId);
    result.fold(
      (l) => emit(MovieDetailsFailState()),
      (r) => emit(
        MovieDetailsLoadedState(r),
      ),
    );
  }
}
