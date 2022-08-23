import 'package:equatable/equatable.dart';

class Mealfiltered extends Equatable {
  final String id;
  final String title;
  final String thumbnail;

  const Mealfiltered({
    required this.id,
    required this.title,
    required this.thumbnail,
  });
  @override
  List<Object?> get props => [id, title, thumbnail];
}
