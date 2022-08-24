part of 'meals_bloc.dart';

abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

class EmptyState extends MealsState {}

class LoadingState extends MealsState {}

class LoadedState extends MealsState {}

class ErrorState extends MealsState {}
