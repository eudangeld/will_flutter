import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/core/error/exceptions.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/core/platform/connectivity_info.dart';
import 'package:will_flutter/features/meals/data/models/categories_list_model.dart';
import 'package:will_flutter/features/meals/data/models/meals_list_model.dart';
import 'package:will_flutter/features/meals/data/sources/meals_remote_datasource.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

import '../../../../mocks/build_runner.mocks.dart';

class MealRepositoryImplementation implements MealRepository {
  final ConnectivityInfo networkInfo;
  final MealsRemoteDataSource remoteDataSource;

  MealRepositoryImplementation({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Meal>>> filterByCategory(
      {required String category}) async {
    await networkInfo.hasConnection;

    try {
      return Right(await remoteDataSource.filterByCategory(category: category));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Categorie>>> getCategories() async {
    await networkInfo.hasConnection;

    try {
      return Right(await remoteDataSource.getCategories());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

void main() {
  late MealRepositoryImplementation sutRepository;
  late MockConnectivityInfo netInfo;
  late MockMealsRemoteDataSource dataSource;

  setUp(() {
    netInfo = MockConnectivityInfo();
    dataSource = MockMealsRemoteDataSource();
    sutRepository = MealRepositoryImplementation(
        networkInfo: netInfo, remoteDataSource: dataSource);
  });

  group('Categories ', () {
    const tCategorie = Categorie(
        id: '1',
        title: 'Testcategorie',
        thumbnail: 'https://www.themealdb.com/images/category/beef.png',
        description: 'An categories description');

    final categorieModel = CategoriesListModel([tCategorie]);

    setUp(() {
      when(netInfo.hasConnection).thenAnswer((_) async => true);
    });

    test('Should return categories data remote source ', () async {
      when(dataSource.getCategories())
          .thenAnswer((_) async => categorieModel.mealCategories);
      final result = await sutRepository.getCategories();
      verify(netInfo.hasConnection);
      result.fold(
        ((_) => {}),
        (rightResul) => expect(rightResul, [tCategorie]),
      );
    });
    test('Should fail with ServerFailure ', () async {
      when(dataSource.getCategories())
          .thenAnswer((_) async => throw ServerException('message'));
      final result = await sutRepository.getCategories();
      result.fold(((leftResult) => {expect(leftResult, isA<ServerFailure>())}),
          (_) => {});
    });
  });
  group('Filter meals by categorie', () {
    const tMeal = Meal(
        id: '1',
        title: 'Testcmeal',
        thumbnail: 'https://www.themealdb.com/images/category/beef.png');

    final mealsModel = MealsListModel([tMeal]);

    setUp(() {
      when(netInfo.hasConnection).thenAnswer((_) async => true);
    });

    test('Should return meals list ', () async {
      when(dataSource.filterByCategory(category: tMeal.title))
          .thenAnswer((_) async => mealsModel.meals);
      final result =
          await sutRepository.filterByCategory(category: tMeal.title);
      verify(netInfo.hasConnection);
      result.fold(
        ((_) => {}),
        (rightResul) => expect(rightResul[0], tMeal),
      );
    });

    test('Should fail with ServerFailure ', () async {
      when(dataSource.filterByCategory(category: tMeal.title))
          .thenAnswer((_) async => throw ServerException('message'));
      final result =
          await sutRepository.filterByCategory(category: tMeal.title);
      result.fold(((leftResult) => {expect(leftResult, isA<ServerFailure>())}),
          (_) => {});
    });
  });
}
