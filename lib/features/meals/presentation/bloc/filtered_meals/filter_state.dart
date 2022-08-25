part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  final List<Meal> meals;
  const FilterState({this.meals = const []});

  @override
  List<Object> get props => [meals];
}

class FilterEmptyState extends FilterState {}

class FilterLoadingState extends FilterState {}

class FilterLoadedState extends FilterState {
  const FilterLoadedState({required List<Meal> meals}) : super(meals: meals);
}

class FilterErrorState extends FilterState {}
