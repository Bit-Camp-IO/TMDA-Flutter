import 'package:equatable/equatable.dart';

class MovieProductionCountries extends Equatable {
  final String countryCode;
  final String countryName;
  const MovieProductionCountries({
    required this.countryCode,
    required this.countryName,
  });

  @override
  List<Object?> get props => [countryCode, countryName];
}
