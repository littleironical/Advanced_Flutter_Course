import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnectedToInternet;
}

class NetworkInfoImplementer implements NetworkInfo {
  InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImplementer(this._internetConnectionChecker);

  @override
  // TODO: implement isConnectedToInternet
  Future<bool> get isConnectedToInternet => _internetConnectionChecker.hasConnection;
}
