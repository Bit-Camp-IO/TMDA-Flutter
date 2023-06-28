import 'package:equatable/equatable.dart';

class TvShowProductionCountry extends Equatable {
  final String countryCode;
  final String countryName;
  const TvShowProductionCountry({
    required this.countryCode,
    required this.countryName,
  });

  @override
  List<Object?> get props => [countryCode, countryName];
}
