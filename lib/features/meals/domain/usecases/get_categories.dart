import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:will_flutter/core/error/failures.dart';
import 'package:will_flutter/core/usecases/usecase.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

class GetCategories implements UseCase<List<Categorie>, NoParams> {
  final MealRepository repository;

  GetCategories(this.repository);

  @override
  Future<Either<Failure, List<Categorie>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
