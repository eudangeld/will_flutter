import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_categorie.dart';

import '../../../../fixture_values/file_value_reader.dart';

class MealCategorieModel extends MealCategorie {
  const MealCategorieModel(
      {required super.id,
      required super.title,
      required super.thumbnail,
      required super.description});

  factory MealCategorieModel.fromJson(Map<String, dynamic> json) {
    return MealCategorieModel(
      id: json['idCategory'],
      title: json['strCategory'],
      thumbnail: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}

void main() {
  const tCategorieMeal = [
    MealCategorieModel(
        id: '1',
        title: 'Title test',
        thumbnail: 'TetThumb',
        description: 'Test description')
  ];
  test('Shoul be a subclas of MealCategorie entity', () {
    expect(tCategorieMeal, isA<List<MealCategorie>>());
  });

  group('Reading json test suite', () {
    test('Shoul read a json and return a correct value', () {
      final Map<String, dynamic> jsonServerResponse =
          jsonDecode(fileReader('categories.json'));

      final result = jsonServerResponse['categories']
          .map((categorie) => MealCategorieModel.fromJson(categorie));

      expect(result, tCategorieMeal);
    });
  });
}
