import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityImpl {
  final _connectivity = Connectivity();
  final connectivityStream = StreamController<ConnectivityResult>();

  ConnectivityImpl() {
    _connectivity.onConnectivityChanged.listen((event) {
      connectivityStream.add(event);
    });
  }
}
