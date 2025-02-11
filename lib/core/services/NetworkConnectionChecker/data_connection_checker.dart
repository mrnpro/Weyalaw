library data_connection_checker;

import 'dart:io';
import 'dart:async';

enum DataConnectionStatus {
  disconnected,
  connected,
}

class DataConnectionChecker {
  static const int defaultPort = 53;
  static const Duration defaultTimeout = Duration(seconds: 10);
  static const Duration defaultInterval = Duration(seconds: 10);

  static final List<AddressCheckOptions> DEFAULT_ADDRESSES = List.unmodifiable([
    AddressCheckOptions(
      InternetAddress('1.1.1.1'),
      port: defaultPort,
      timeout: defaultTimeout,
    ),
    AddressCheckOptions(
      InternetAddress('8.8.4.4'),
      port: defaultPort,
      timeout: defaultTimeout,
    ),
    AddressCheckOptions(
      InternetAddress('208.67.222.222'),
      port: defaultPort,
      timeout: defaultTimeout,
    ),
  ]);

  List<AddressCheckOptions> addresses = DEFAULT_ADDRESSES;

  factory DataConnectionChecker() => _instance;
  DataConnectionChecker._() {
    _statusController.onListen = () {
      _maybeEmitStatusUpdate();
    };
    _statusController.onCancel = () {
      _timerHandle?.cancel();
      _lastStatus = null;
    };
  }
  static final DataConnectionChecker _instance = DataConnectionChecker._();

  Future<AddressCheckResult> isHostReachable(
    AddressCheckOptions options,
  ) async {
    Socket? sock;
    try {
      sock = await Socket.connect(
        options.address,
        options.port,
        timeout: options.timeout,
      );
      sock.destroy();
      return AddressCheckResult(options, true);
    } catch (e) {
      sock?.destroy();
      return AddressCheckResult(options, false);
    }
  }

  List<AddressCheckResult> get lastTryResults => _lastTryResults;
  List<AddressCheckResult> _lastTryResults = <AddressCheckResult>[];

  Future<bool> get hasConnection async {
    List<Future<AddressCheckResult>> requests = [];

    for (var addressOptions in addresses) {
      requests.add(isHostReachable(addressOptions));
    }
    _lastTryResults = List.unmodifiable(await Future.wait(requests));

    return _lastTryResults.map((result) => result.isSuccess).contains(true);
  }

  Future<DataConnectionStatus> get connectionStatus async {
    return await hasConnection
        ? DataConnectionStatus.connected
        : DataConnectionStatus.disconnected;
  }

  Duration checkInterval = defaultInterval;

  _maybeEmitStatusUpdate([Timer? timer]) async {
    _timerHandle?.cancel();
    timer?.cancel();

    var currentStatus = await connectionStatus;

    if (_lastStatus != currentStatus && _statusController.hasListener) {
      _statusController.add(currentStatus);
    }

    if (!_statusController.hasListener) return;
    _timerHandle = Timer(checkInterval, _maybeEmitStatusUpdate);

    _lastStatus = currentStatus;
  }

  DataConnectionStatus? _lastStatus;
  Timer? _timerHandle;

  final StreamController<DataConnectionStatus> _statusController =
      StreamController.broadcast();

  Stream<DataConnectionStatus> get onStatusChange => _statusController.stream;

  bool get hasListeners => _statusController.hasListener;

  bool get isActivelyChecking => _statusController.hasListener;
}

class AddressCheckOptions {
  final InternetAddress address;
  final int port;
  final Duration timeout;

  AddressCheckOptions(
    this.address, {
    this.port = DataConnectionChecker.defaultPort,
    this.timeout = DataConnectionChecker.defaultTimeout,
  });

  @override
  String toString() => "AddressCheckOptions($address, $port, $timeout)";
}

class AddressCheckResult {
  final AddressCheckOptions options;
  final bool isSuccess;

  AddressCheckResult(
    this.options,
    this.isSuccess,
  );

  @override
  String toString() => "AddressCheckResult($options, $isSuccess)";
}
