import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_network.dart';

class TvShowNetworkModel extends TvShowNetwork {
  const TvShowNetworkModel({
    required super.id,
    required super.name,
  });

  factory TvShowNetworkModel.fromJson(List<dynamic> tvShowNetworkList) {
    if (tvShowNetworkList.isNotEmpty) {
      return TvShowNetworkModel(
        id: tvShowNetworkList[0]['id'],
        name: tvShowNetworkList[0]['name'],
      );
    }else{
      return const TvShowNetworkModel(
        id: 0,
        name: 'NaN',
      );
    }
  }
}
