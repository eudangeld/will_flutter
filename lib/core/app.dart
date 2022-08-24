import 'package:flutter/material.dart';
import 'package:will_flutter/features/meals/presentation/pages/categories_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesPage(),
    );
  }
}
