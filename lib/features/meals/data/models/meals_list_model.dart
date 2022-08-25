import 'package:will_flutter/features/meals/domain/entities/meal.dart';

class MealsListModel {
  final List<Meal> meals;

  factory MealsListModel.fromJson(Map<String, dynamic> categorieListJson) {
    final parsedMeals = categorieListJson['meals'] as List;
    final mappedMeals = parsedMeals
        .map<Meal>((categorie) => Meal(
            id: categorie['idMeal'],
            title: categorie['strMeal'],
            thumbnail: categorie['strMealThumb']))
        .toList();

    return MealsListModel(mappedMeals);
  }

  MealsListModel(this.meals);
}
