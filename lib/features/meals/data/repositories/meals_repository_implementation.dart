import 'package:will_flutter/core/error/exceptions.dart';
import 'package:will_flutter/core/platform/connectivity_info.dart';
import 'package:will_flutter/features/meals/data/sources/meals_remote_datasource.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

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
