import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/usecases/get_categories.dart';
import 'package:will_flutter/features/meals/presentation/bloc/categories/categories_bloc.dart';

import '../../../../../mocks/build_runner.mocks.dart';

void main() {
  late CategoriesBloc sut;
  late MockGetCategorieUseCase mockGetCategoriesUseCase;

  const mockedCategorie = Categorie(
      id: '1',
      title: 'Testcategorie',
      thumbnail: 'https://www.themealdb.com/images/category/beef.png',
      description: 'An categories description');

  const mealCategories = [mockedCategorie];

  group('Categories bloc group test', () {
    setUp(() {
      mockGetCategoriesUseCase = MockGetCategorieUseCase();
      sut = CategoriesBloc(mockGetCategoriesUseCase);
    });

    test('InitalState should be CategoriesEmptyState ', () async {
      expect(sut.state, equals(CategoriesEmptyState()));
    });
    test('Should emits ir order Loading and Loaded', () async {
      when(mockGetCategoriesUseCase(NoParams()))
          .thenAnswer((_) async => Future.value(const Right(mealCategories)));

      sut.add(GetCategoriesEvent());
      await expectLater(
          sut.stream,
          emitsInOrder([
            CategoriesLoadingState(),
            const CategoriesLoadedState(categories: mealCategories)
          ]));
    });
    test('Should emit  [ErrorState]]', () async {
      when(mockGetCategoriesUseCase(NoParams()))
          .thenAnswer((_) async => Future.value(Left(ServerFailure())));

      sut.add(GetCategoriesEvent());

      await expectLater(sut.stream,
          emitsInOrder([CategoriesLoadingState(), CategoriesErrorState()]));
    });
  });
}
