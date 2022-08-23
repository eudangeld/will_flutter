import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';

abstract class MealRepository {
  Future<Either<Failure, List<Categorie>>> getCategories();
  Future<Either<Failure, List<Meal>>> filterByCategory(
      {@required String category});
}
