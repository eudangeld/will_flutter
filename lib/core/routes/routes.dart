import 'package:flutter/material.dart';
import 'package:will_flutter/features/meals/presentation/pages/categories_page.dart';
import 'package:will_flutter/features/meals/presentation/pages/filtered_page_page.dart';

class AppRoutes {
  static const HOME_ROUTE = '/';
  static const FILTRED_ROUTE = '/filter';

  Map<String, WidgetBuilder> get routesBuilder => {
        AppRoutes.HOME_ROUTE: ((context) => const CategoriesPage()),
        AppRoutes.FILTRED_ROUTE: ((context) => const FilteredPage())
      };
}
