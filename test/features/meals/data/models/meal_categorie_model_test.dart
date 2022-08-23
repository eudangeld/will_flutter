import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:will_flutter/features/meals/data/models/meal_categorie_model.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_categorie.dart';

import '../../../../fixture_values/file_value_reader.dart';

void main() {
  const tCategorieMeal = MealCategorie(
      id: '1',
      title: 'Title test',
      thumbnail: 'TetThumb',
      description: 'Test description');

  test('Should cast a json response into a list of Categories', () {
    final Map<String, dynamic> jsonServerResponse =
        jsonDecode(fileReader('categories.json'));

    final result = MealCategorieListModel.fromJson(jsonServerResponse);

    expect(result.mealCategories[0], tCategorieMeal);
  });
}
