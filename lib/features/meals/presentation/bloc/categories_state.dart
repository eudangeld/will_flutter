part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CatgoriesEmptyState extends CategoriesState {}

class CatgoriesLoadingState extends CategoriesState {}

class CatgoriesLoadedState extends CategoriesState {}

class CatgoriesErrorState extends CategoriesState {}
