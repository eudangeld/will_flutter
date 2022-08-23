import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_categorie.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_filtered.dart';

abstract class MealRepository {
  Future<Either<Failure, List<MealCategorie>>> getCategories();
  Future<Either<Failure, List<Mealfiltered>>> filterByCategory(
      {@required String category});
}
