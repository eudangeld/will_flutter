import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:will_flutter/features/meals/domain/entities/meal.dart';
import 'package:will_flutter/features/meals/domain/usecases/filter_by_categorie.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final FilterByCategorie filterMeals;

  FilterBloc(this.filterMeals)
      : super(const FilterEmptyState(filterString: '')) {
    on<FilterMealsByCategorieEvent>((event, emit) async {
      emit(FilterLoadingState(filterString: event.categorieFilter));
      final meals =
          await filterMeals(Params(categorieName: event.categorieFilter));
      meals.fold(
        (leftResult) =>
            emit(FilterErrorState(filterString: event.categorieFilter)),
        ((rightResult) => emit(FilterLoadedState(
            filterString: event.categorieFilter, meals: rightResult))),
      );
    });
  }
}
