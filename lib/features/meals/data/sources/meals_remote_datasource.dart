import 'package:flutter/foundation.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';

abstract class MealsRemoteDataSource {
  Future<List<Categorie>> getCategories();
  Future<List<Meal>> filterByCategory({@required String category});
}
