import 'package:dartz/dartz.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_filtered.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

class FilterByCategorie {
  final MealRepository repository;

  FilterByCategorie(this.repository);

  Future<Either<Failure, List<Mealfiltered>>> call(String categorieName) async {
    return await repository.filterByCategory(category: categorieName);
  }
}
