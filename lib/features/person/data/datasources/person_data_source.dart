import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/features/person/data/models/person_model.dart';

abstract class PersonDataSource{
  Future<PersonModel> getPersonData({required int personId});
}

@LazySingleton(as: PersonDataSource)
class PersonDataSourceImpl extends PersonDataSource{
  final ApiConsumer _apiConsumer;
  PersonDataSourceImpl(@Named(ApiConstants.unAuthenticatedConsumer)this._apiConsumer);
  
  @override
  Future<PersonModel> getPersonData({required int personId}) async{
    final personData = await _apiConsumer.get('${ApiConstants.personEndPoint}$personId', queryParameters: {
      'append_to_response' : ApiConstants.personEndPointAppendedToResponse,
    });
    return PersonModel.fromJson(personData);
  }
}