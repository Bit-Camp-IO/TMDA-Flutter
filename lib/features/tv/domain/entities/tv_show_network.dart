
import 'package:equatable/equatable.dart';

class TvShowNetwork extends Equatable{
  final int id;
  final String name;
  const TvShowNetwork({
    required this.id,
    required this.name,
  });
  
  @override
  List<Object?> get props => [id, name];
}
