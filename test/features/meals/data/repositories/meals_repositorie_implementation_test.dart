import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/core/platform/connectivity_info.dart';
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
    // TODO: implement filterByCategory
    throw UnimplementedError();

    Future.value();
  }

  @override
  Future<Either<Failure, List<Categorie>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
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
}
