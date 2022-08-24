import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectivityInfo {
  Future<bool> get hasConnection;
}

class ConnectivityInfoImplementation implements ConnectivityInfo {
  final InternetConnectionChecker connectivityChecker;

  ConnectivityInfoImplementation(this.connectivityChecker);

  @override
  Future<bool> get hasConnection async =>
      await connectivityChecker.hasConnection;
}
