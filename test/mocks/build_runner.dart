import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:will_flutter/core/platform/connectivity_info.dart';
import 'package:will_flutter/features/meals/data/sources/meals_remote_datasource.dart';
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart';

@GenerateMocks([], customMocks: [
  MockSpec<MealRepository>(as: #MockMealRepository),
  MockSpec<ConnectivityInfo>(as: #MockConnectivityInfo),
  MockSpec<MealsRemoteDataSource>(as: #MockMealsRemoteDataSource),
  MockSpec<InternetConnectionChecker>(as: #MockInternetConnectionChecker),
])
void main() {}
