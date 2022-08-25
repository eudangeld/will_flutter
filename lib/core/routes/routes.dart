// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:will_flutter/features/meals/presentation/pages/categories_page.dart';
import 'package:will_flutter/features/meals/presentation/pages/filtered_page_page.dart';

class AppRoutes {
  static const HOME_ROUTE = '/';
  static const FILTRED_ROUTE = '/filter';

  Map<String, WidgetBuilder> get routesBuilder => {
        HOME_ROUTE: ((context) => const CategoriesPage()),
        FILTRED_ROUTE: ((context) => const FilteredPage())
      };
}
