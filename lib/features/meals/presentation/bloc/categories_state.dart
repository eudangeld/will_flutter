part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  final List<Categorie> categories;
  const CategoriesState({this.categories = const []});

  @override
  List<Object> get props => [categories];
}

class CategoriesEmptyState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  const CategoriesLoadedState({required List<Categorie> categories})
      : super(categories: categories);
}

class CategoriesErrorState extends CategoriesState {}
