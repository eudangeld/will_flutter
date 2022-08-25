part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  final List<Meal> meals;
  final String filterString;
  const FilterState({this.filterString = '', this.meals = const []});

  @override
  List<Object> get props => [meals];
}

class FilterEmptyState extends FilterState {}

class FilterLoadingState extends FilterState {}

class FilterLoadedState extends FilterState {
  const FilterLoadedState({required filterString, required List<Meal> meals})
      : super(filterString: filterString, meals: meals);
}

class FilterErrorState extends FilterState {}
