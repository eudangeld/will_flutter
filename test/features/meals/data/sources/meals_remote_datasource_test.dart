import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:will_flutter/core/error/exceptions.dart';
import 'package:will_flutter/features/meals/data/sources/meals_remote_datasource.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';

import '../../../../fixture_values/file_value_reader.dart';

void main() {
  late MealsRemotaDataSourceImplementation sut;
  late Dio dio;
  late DioAdapter dioAdapter;

  const categorieMatcher = Categorie(
      id: "1",
      title: "Title test",
      thumbnail: "TetThumb",
      description: "Test description");

  group('Catgories data source test group', () {
    const baseUrl = 'https://www.themealdb.com/api/json/v1/1';

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter =
          DioAdapter(dio: dio, matcher: const FullHttpRequestMatcher());
      sut = MealsRemotaDataSourceImplementation(dio);
    });

    test('Should return the categorie list after a sucses API response',
        () async {
      const tRoute = '/categories.php';
      dioAdapter.onGet(
        tRoute,
        (server) =>
            server.reply(200, jsonDecode(fileReader('categories.json'))),
      );

      final result = await sut.getCategories();

      expect(result, isA<List<Categorie>>());
      expect(result[0], categorieMatcher);
    });
    test(
        'Should throw a ServerException if somethng went wrong with API request',
        () async {
      const tRoute = '/categories.php';
      dioAdapter.onGet(tRoute, (server) => server.reply(404, {}));

      final call = sut.getCategories;

      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });
  group('Meals list data source test group', () {
    const baseUrl = 'https://www.themealdb.com/api/json/v1/1';
    const tMealRequestCategorie = 'Test categorie';

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter =
          DioAdapter(dio: dio, matcher: const FullHttpRequestMatcher());
      sut = MealsRemotaDataSourceImplementation(dio);
    });

    test('Should return the meals list', () async {
      const tRoute = '/filter.php?c=$tMealRequestCategorie';
      dioAdapter.onGet(
        tRoute,
        (server) => server.reply(200, jsonDecode(fileReader('meals.json'))),
      );

      final result =
          await sut.filterByCategory(category: tMealRequestCategorie);

      expect(result, isA<List<Meal>>());
    });
    test(
        'Should throw a ServerException if something went wrong with API request',
        () async {
      const tRoute = '/filter.php?c=$tMealRequestCategorie';
      dioAdapter.onGet(tRoute, (server) => server.reply(404, {}));

      final call = sut.filterByCategory;

      expect(() => call(category: tMealRequestCategorie),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
