import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meal_categorie_event.dart';
part 'meal_categorie_state.dart';

class MealCategorieBloc extends Bloc<MealCategorieEvent, MealCategorieState> {
  MealCategorieBloc() : super(MealCategorieInitial()) {
    on<MealCategorieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
