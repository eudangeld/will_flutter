import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:will_flutter/core/platform/connectivity_info.dart';
import 'package:will_flutter/core/usecases/usecase.dart';
import 'package:will_flutter/features/meals/data/repositories/meals_repository_implementation.dart';
import 'package:will_flutter/features/meals/data/sources/meals_remote_datasource.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';
import 'package:will_flutter/features/meals/domain/usecases/get_categories.dart';
import 'package:will_flutter/features/meals/presentation/bloc/categories/categories_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  categoriesBloc();
}

void categoriesBloc() {
  serviceLocator
      .registerFactory<CategoriesBloc>(() => CategoriesBloc(serviceLocator()));

  serviceLocator
      .registerLazySingleton<UseCase>(() => GetCategories(serviceLocator()));

  serviceLocator
      .registerLazySingleton<MealRepository>(() => MealRepositoryImplementation(
            networkInfo: serviceLocator(),
            remoteDataSource: serviceLocator(),
          ));
  serviceLocator.registerLazySingleton<ConnectivityInfo>(
      () => ConnectivityInfoImplementation(InternetConnectionChecker()));

  serviceLocator.registerLazySingleton<MealsRemoteDataSource>(
      () => MealsRemotaDataSourceImplementation(Dio()));
}
