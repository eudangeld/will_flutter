import 'package:will_flutter/features/meals/domain/entities/categorie.dart';

class CategoriesListModel {
  final List<Categorie> mealCategories;

  factory CategoriesListModel.fromJson(Map<String, dynamic> categorieListJson) {
    final parsedCategories = categorieListJson['categories'] as List;
    final mappedCategories = parsedCategories
        .map<Categorie>((categorie) => Categorie(
              id: categorie['idCategory'],
              title: categorie['strCategory'],
              thumbnail: categorie['strCategoryThumb'],
              description: categorie['strCategoryDescription'],
            ))
        .toList();

    return CategoriesListModel(mappedCategories);
  }

  CategoriesListModel(this.mealCategories);
}
