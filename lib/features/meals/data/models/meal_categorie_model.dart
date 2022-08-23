import 'package:will_flutter/features/meals/domain/entities/meal_categorie.dart';

class MealCategorieListModel {
  final List<MealCategorie> mealCategories;

  factory MealCategorieListModel.fromJson(
      Map<String, dynamic> categorieListJson) {
    final parsedCategories = categorieListJson['categories'] as List;
    final mappedCategories = parsedCategories
        .map<MealCategorie>((categorie) => MealCategorie(
              id: categorie['idCategory'],
              title: categorie['strCategory'],
              thumbnail: categorie['strCategoryThumb'],
              description: categorie['strCategoryDescription'],
            ))
        .toList();

    return MealCategorieListModel(mappedCategories);
  }

  MealCategorieListModel(this.mealCategories);
}
