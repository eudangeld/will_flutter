import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/usecases/get_categories.dart';

import 'meals_repository_mock.mocks.dart';

void main() {
  late GetCategories useCase;
  late MockMealRepository mockedMealRepository;

  const categorie = Categorie(
      id: '1',
      title: 'Testcategorie',
      thumbnail: 'https://www.themealdb.com/images/category/beef.png',
      description: 'An categories description');

  const mealCategories = [categorie];

  group('Meal categorie test group', () {
    setUp(() {
      mockedMealRepository = MockMealRepository();
      useCase = GetCategories(mockedMealRepository);
    });

    test('Should get a list of categories', () async {
      when(mockedMealRepository.getCategories())
          .thenAnswer((_) => Future.value(const Right(mealCategories)));

      final result = await useCase(NoParams());

      result.fold((_) {},
          ((categoriesResult) => expect(categoriesResult, mealCategories)));
    });
  });
}
