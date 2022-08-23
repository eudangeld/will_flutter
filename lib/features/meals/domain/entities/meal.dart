import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final String id;
  final String title;
  final String thumbnail;

  const Meal({
    required this.id,
    required this.title,
    required this.thumbnail,
  });
  @override
  List<Object?> get props => [id, title, thumbnail];
}
