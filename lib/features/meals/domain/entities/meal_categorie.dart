import 'package:equatable/equatable.dart';

class MealCategorie extends Equatable {
  final String id;
  final String title;
  final String thumbnail;
  final String description;

  const MealCategorie({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
  });

  @override
  List<Object?> get props => [id, title, thumbnail, description];
}
