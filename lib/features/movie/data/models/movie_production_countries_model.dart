import 'package:tmda/features/movie/domain/entities/movie_production_countries.dart';

class MovieProductionCountriesModel extends MovieProductionCountries {
  const MovieProductionCountriesModel({
    required super.countryCode,
    required super.countryName,
  });

  factory MovieProductionCountriesModel.fromJson(
      List<dynamic> productionCountriesList) {
    if (productionCountriesList.isEmpty) {
      return const MovieProductionCountriesModel(
        countryCode: 'Unknown',
        countryName: 'Unknown',
      );
    } else {
      return MovieProductionCountriesModel(
        countryCode: productionCountriesList[0]['iso_3166_1'],
        countryName: productionCountriesList[0]['name'],
      );
    }
  }
}
