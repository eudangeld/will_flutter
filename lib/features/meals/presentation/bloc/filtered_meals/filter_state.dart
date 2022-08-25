part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  final List<Meal> meals;
  final String filterString;
  const FilterState({required this.filterString, this.meals = const []});

  @override
  List<Object> get props => [meals];
}

class FilterEmptyState extends FilterState {
  const FilterEmptyState({required super.filterString});
}

class FilterLoadingState extends FilterState {
  const FilterLoadingState({required super.filterString});
}

class FilterLoadedState extends FilterState {
  const FilterLoadedState({required filterString, required List<Meal> meals})
      : super(filterString: filterString, meals: meals);
}

class FilterErrorState extends FilterState {
  const FilterErrorState({required super.filterString});
}
