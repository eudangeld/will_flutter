import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:will_flutter/features/meals/data/models/meals_list_model.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';

import '../../../../fixture_values/file_value_reader.dart';

void main() {
  const tMeals = Meal(
      id: '52959',
      title: "Baked salmon with fennel & tomatoes",
      thumbnail: "https://www.themealdb.com/images/media/meals/1548772327.jpg");

  test('Should cast meals list from json server response', () {
    final Map<String, dynamic> jsonServerResponse =
        jsonDecode(fileReader('meals.json'));

    final result = MealsListModel.fromJson(jsonServerResponse);

    expect(result.meals[0], tMeals);
  });
}
