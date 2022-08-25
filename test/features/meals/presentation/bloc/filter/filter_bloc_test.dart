import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';
import 'package:will_flutter/features/meals/domain/usecases/filter_by_categorie.dart';
import 'package:will_flutter/features/meals/presentation/bloc/filtered_meals/filter_bloc.dart';

import '../../../../../mocks/build_runner.mocks.dart';

void main() {
  late FilterBloc sut;
  late MockFilterMealUseCase mockFilterMealsUseCase;

  const mockedFilteredMeal = Meal(
    id: '1',
    title: 'Testcategorie',
    thumbnail: 'https://www.themealdb.com/images/category/beef.png',
  );

  const mealCategories = [mockedFilteredMeal];

  group('Filter meals bloc group test', () {
    setUp(() {
      mockFilterMealsUseCase = MockFilterMealUseCase();
      sut = FilterBloc(mockFilterMealsUseCase);
    });

    test('InitalState should be FilterEmptyState ', () async {
      expect(sut.state, equals(FilterEmptyState()));
    });
    test('Should emits ir order Loading and Loaded', () async {
      when(mockFilterMealsUseCase(
              Params(categorieName: mockedFilteredMeal.title)))
          .thenAnswer((_) async => Future.value(const Right(mealCategories)));

      sut.add(FilterMealsByCategorieEvent(mockedFilteredMeal.title));
      await expectLater(
          sut.stream,
          emitsInOrder([
            FilterLoadingState(),
            const FilterLoadedState(meals: mealCategories)
          ]));
    });
    test('Should emit  [ErrorState]]', () async {
      when(mockFilterMealsUseCase(
              Params(categorieName: mockedFilteredMeal.title)))
          .thenAnswer((_) async => Future.value(Left(ServerFailure())));

      sut.add(FilterMealsByCategorieEvent(mockedFilteredMeal.title));

      await expectLater(
          sut.stream, emitsInOrder([FilterLoadingState(), FilterErrorState()]));
    });
  });
}
