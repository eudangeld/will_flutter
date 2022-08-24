import 'package:dio/dio.dart';
import 'package:will_flutter/core/error/exceptions.dart';
import 'package:will_flutter/features/meals/data/models/categories_list_model.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';

abstract class MealsRemoteDataSource {
  Future<List<Categorie>> getCategories();
  Future<List<Meal>> filterByCategory({required String category});
}

class MealsRemotaDataSourceImplementation implements MealsRemoteDataSource {
  final Dio httpClient;
  final baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  MealsRemotaDataSourceImplementation(this.httpClient) {}

  @override
  Future<List<Meal>> filterByCategory({required String category}) {
    return Future.value([]);
  }

  @override
  Future<List<Categorie>> getCategories() async {
    try {
      final response = await httpClient.get('/categories.php');
      return CategoriesListModel.fromJson(response.data).mealCategories;
    } on DioError {
      throw ServerException('message');
    }
  }
}
