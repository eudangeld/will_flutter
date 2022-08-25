import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_flutter/features/meals/presentation/bloc/filtered_meals/filter_bloc.dart';
import 'package:will_flutter/features/meals/presentation/widgets/base_scroll_config.dart';

class FilteredPage extends StatelessWidget {
  const FilteredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            BlocProvider.of<FilterBloc>(context).state.meals.length.toString()),
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          if (state is FilterLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FilterEmptyState) {
            BlocProvider.of<FilterBloc>(context)
                .add(const FilterMealsByCategorieEvent('Pork'));
          }
          final filtered = state.meals;
          return BaseScrollConfig(
            ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: filtered.length,
              itemBuilder: (BuildContext context, int index) =>
                  ListTile(title: Text(filtered[index].title)),
            ),
          );
        },
      ),
    );
  }
}
