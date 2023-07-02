import 'package:tmda/features/search/domain/entities/person_search.dart';

class PersonSearchModel extends PersonSearch {
  const PersonSearchModel({
    required super.id,
    required super.name,
    required super.knowingFor,
    required super.profilePath,
  });

  factory PersonSearchModel.fromJson(Map<String, dynamic> jsonData) {
    return PersonSearchModel(
        id: jsonData['id'],
        name: jsonData['name'],
        knowingFor: jsonData['known_for_department'] ?? '',
        profilePath: jsonData['profile_path'] ?? '',
    );
  }
}
