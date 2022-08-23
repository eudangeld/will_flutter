import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_filtered.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';
import 'package:will_flutter/features/meals/domain/usecases/filter_by_categorie.dart';

import 'get_categories_dart_test.mocks.dart';

@GenerateMocks([MealRepository])
void main() {
  late FilterByCategorie useCase;
  late MockMealRepository mockedMealRepository;

  const tTitleFilter = 'TestCategorie title';

  const tFiltered = Mealfiltered(
      id: '1',
      title: 'Result filtered',
      thumbnail: 'https://www.themealdb.com/images/category/beef.png');

  const tResult = [tFiltered];

  group('Meal filterBy test group', () {
    setUp(() {
      mockedMealRepository = MockMealRepository();
      useCase = FilterByCategorie(mockedMealRepository);
    });

    test('Should fielter by categorie name', () async {
      when(mockedMealRepository.filterByCategory(category: tTitleFilter))
          .thenAnswer((_) => Future.value(const Right(tResult)));

      final result = await useCase(const Params(categorieName: tTitleFilter));

      result.fold(
          (_) {}, ((rightResult) => expectLater(rightResult, [tFiltered])));
    });
  });
}
