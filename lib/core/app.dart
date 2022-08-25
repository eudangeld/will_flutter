import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_flutter/features/meals/presentation/bloc/categories/categories_bloc.dart';
import 'package:will_flutter/features/meals/presentation/pages/categories_page.dart';
import 'package:will_flutter/injection_container.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CategoriesBloc>(),
      child: MaterialApp(
        home: CategoriesPage(),
      ),
    );
  }
}
