import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_flutter/core/routes/routes.dart';
import 'package:will_flutter/features/meals/presentation/bloc/categories/categories_bloc.dart';
import 'package:will_flutter/di_container.dart';
import 'package:will_flutter/features/meals/presentation/bloc/filtered_meals/filter_bloc.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final routes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<CategoriesBloc>()),
        BlocProvider(create: (context) => serviceLocator<FilterBloc>()),
      ],
      child: MaterialApp(routes: routes.routesBuilder),
    );
  }
}
