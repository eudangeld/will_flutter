import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_categorie.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

import 'get_categories_dart_test.mocks.dart';

class GetCategories {
  final MealRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, List<MealCategorie>>> call() async {
    return await repository.getCategories();
  }
}

@GenerateMocks([MealRepository])
void main() {
  late GetCategories useCase;
  late MockMealRepository mockedMealRepository;

  const categorie = MealCategorie(
      id: '1',
      title: 'Testcategorie',
      thumbnail: 'https://www.themealdb.com/images/category/beef.png',
      description: 'An categories description');

  const mealCategories = [categorie];

  group('Meal categorietetst suite', () {
    setUp(() {
      mockedMealRepository = MockMealRepository();
      useCase = GetCategories(mockedMealRepository);
    });

    test('Should get a list of categories', () async {
      when(mockedMealRepository.getCategories())
          .thenAnswer((_) => Future.value(const Right(mealCategories)));

      final result = await useCase();

      result.fold((_) {},
          ((categoriesResult) => expect(categoriesResult, mealCategories)));
    });
  });
}
