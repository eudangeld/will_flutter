part of 'meals_bloc.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object> get props => [];
}

class GetMealsCategoriesEvent extends MealsEvent {}

class FilterByCategorie extends MealsEvent {
  final String categorie;

  const FilterByCategorie(this.categorie);

  @override
  List<Object> get props => [categorie];
}
