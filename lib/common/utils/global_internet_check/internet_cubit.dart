import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { initial, gained, lost }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;

  InternetCubit() : super(InternetState.initial) {
    _checkInitialConnection();
    _subscription = _connectivity.onConnectivityChanged.listen(_onChanged);
  }

  Future<void> _checkInitialConnection() async {
    final results = await _connectivity.checkConnectivity();
    _emitState(results);
  }

  void _onChanged(dynamic result) {
    // Newer versions return List<ConnectivityResult>
    if (result is List<ConnectivityResult>) {
      _emitState(result);
    } else if (result is ConnectivityResult) {
      _emitState([result]);
    }
  }

  void _emitState(List<ConnectivityResult> results) {
    final hasConnection = results.any(
      (r) =>
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.ethernet,
    );

    emit(hasConnection ? InternetState.gained : InternetState.lost);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
