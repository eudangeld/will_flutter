import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/core/usecases/usecase.dart';
import 'package:will_flutter/features/meals/domain/entities/meal_filtered.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

class FilterByCategorie implements UseCase<List<Mealfiltered>, Params> {
  final MealRepository repository;

  FilterByCategorie(this.repository);

  Future<Either<Failure, List<Mealfiltered>>> call(Params params) async {
    return await repository.filterByCategory(category: params.categorieName);
  }
}

class Params extends Equatable {
  final String categorieName;

  const Params({required this.categorieName});

  @override
  List<Object?> get props => [categorieName];
}
