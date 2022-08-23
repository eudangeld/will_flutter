import 'package:dartz/dartz.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_categorie.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

class GetCategories {
  final MealRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, List<MealCategorie>>> call() async {
    return await repository.getCategories();
  }
}
