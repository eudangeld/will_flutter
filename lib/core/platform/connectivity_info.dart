import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class ConnectivityInfo {
  Future<bool> get hasConnection;
}

class ConnectivityInfoImplementation implements ConnectivityInfo {
  final InternetConnectionCheckerPlus connectivityChecker;

  ConnectivityInfoImplementation(this.connectivityChecker);

  @override
  Future<bool> get hasConnection async =>
      await connectivityChecker.hasConnection;
}
