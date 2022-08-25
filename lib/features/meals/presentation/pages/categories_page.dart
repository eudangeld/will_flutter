import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_flutter/core/routes/routes.dart';
import 'package:will_flutter/features/meals/presentation/bloc/categories/categories_bloc.dart';
import 'package:will_flutter/features/meals/presentation/bloc/filtered_meals/filter_bloc.dart';
import 'package:will_flutter/features/meals/presentation/widgets/base_scroll_config.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoriesEmptyState) {
            BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent());
          }
          final categories = state.categories;
          return BaseScrollConfig(
            ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(categories[index].title),
                  onTap: () {
                    BlocProvider.of<FilterBloc>(context).add(
                        FilterMealsByCategorieEvent(categories[index].title));
                    Navigator.of(context).pushNamed(AppRoutes.FILTRED_ROUTE);
                  }),
            ),
          );
        },
      ),
    );
  }
}
