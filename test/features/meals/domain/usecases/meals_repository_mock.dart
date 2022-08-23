import 'package:mockito/annotations.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

@GenerateMocks([],
    customMocks: [MockSpec<MealRepository>(as: #MockMealRepository)])
void main() {}
