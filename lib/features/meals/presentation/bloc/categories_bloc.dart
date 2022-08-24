import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:will_flutter/features/meals/domain/entities/categorie.dart';
import 'package:will_flutter/features/meals/domain/usecases/get_categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategories getCategorieUseCase;

  CategoriesBloc(this.getCategorieUseCase) : super(CategoriesEmptyState()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      final categories = await getCategorieUseCase(NoParams());
      categories.fold(
        (leftResult) => emit(CategoriesErrorState()),
        ((rightResult) => emit(CategoriesLoadedState(categories: rightResult))),
      );
    });
  }
}
