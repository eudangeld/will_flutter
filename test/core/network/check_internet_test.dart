import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:will_flutter/core/platform/connectivity_info.dart';

import '../../mocks/build_runner.mocks.dart';

void main() {
  late MockInternetConnectionChecker mockedNetInfoDependencie;
  late ConnectivityInfoImplementation sut;
  setUp(() {
    mockedNetInfoDependencie = MockInternetConnectionChecker();
    sut = ConnectivityInfoImplementation(mockedNetInfoDependencie);
  });
  group('NetInfo checker implementation tests', () {
    test('Should return true ', () async {
      when(mockedNetInfoDependencie.hasConnection)
          .thenAnswer((_) async => true);

      final result = await sut.hasConnection;

      expect(result, true);
    });
    test('Should return false ', () async {
      when(mockedNetInfoDependencie.hasConnection)
          .thenAnswer((_) async => false);

      final result = await sut.hasConnection;

      expect(result, false);
    });
  });
}
