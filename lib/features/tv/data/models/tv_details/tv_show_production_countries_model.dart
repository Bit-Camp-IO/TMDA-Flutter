import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_production_country.dart';

class TvShowProductionCountryModel extends TvShowProductionCountry {
  const TvShowProductionCountryModel({
    required super.countryCode,
    required super.countryName,
  });

  factory TvShowProductionCountryModel.fromJson(List<dynamic> productionCountriesList){
    if (productionCountriesList.isEmpty) {
      return const TvShowProductionCountryModel(
        countryCode: 'Unknown',
        countryName: 'Unknown',
      );
    } else {
      return TvShowProductionCountryModel(
        countryCode: productionCountriesList[0]['iso_3166_1'],
        countryName: productionCountriesList[0]['name'],
      );
    }
  }
}
