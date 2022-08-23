import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/core/platform/connectivity_info.dart';
import 'package:will_flutter/features/meals/data/models/categories_list_model.dart';
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
    final hasConnection = await networkInfo.hasConnection;
    if (!hasConnection) {
      print('Have no connection');
    }

    return const Right([]);

    // return Right(await remoteDataSource.filterByCategory(category: category));
  }

  @override
  Future<Either<Failure, List<Categorie>>> getCategories() async {
    final hasConnection = await networkInfo.hasConnection;
    if (!hasConnection) {
      print('Have no connection');
    }

    return Right(await remoteDataSource.getCategories());
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

  group('Categories With connection', () {
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
  });
}
