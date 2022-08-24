import 'package:dio/dio.dart';
import 'package:will_flutter/core/error/exceptions.dart';
import 'package:will_flutter/features/meals/data/models/categories_list_model.dart';
import 'package:will_flutter/features/meals/data/models/meals_list_model.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';

abstract class MealsRemoteDataSource {
  Future<List<Categorie>> getCategories();
  Future<List<Meal>> filterByCategory({required String category});
}

class MealsRemotaDataSourceImplementation implements MealsRemoteDataSource {
  final Dio httpClient;
  final baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  MealsRemotaDataSourceImplementation(this.httpClient) {
    //TODO [Maybe] define env url's
    httpClient.options.baseUrl = baseUrl;
  }

  @override
  Future<List<Meal>> filterByCategory({required String category}) async {
    try {
      final response = await httpClient.get('/filter.php?c=$category');
      return MealsListModel.fromJson(response.data).meals;
    } on DioError catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<Categorie>> getCategories() async {
    try {
      final response = await httpClient.get('/categories.php');
      return CategoriesListModel.fromJson(response.data).mealCategories;
    } on DioError catch (e) {
      throw ServerException(e.message);
    }
  }
}
