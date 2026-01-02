import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/placeholder/no_internet.dart';
import 'internet_cubit.dart';

class NetworkObserver extends StatefulWidget {
  final Widget child;
  final VoidCallback? onRetry;

  const NetworkObserver({super.key, required this.child, this.onRetry});

  @override
  State<NetworkObserver> createState() => _NetworkObserverState();
}

class _NetworkObserverState extends State<NetworkObserver> {
  bool _wasDisconnected = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state == InternetState.lost) {
          _wasDisconnected = true;
        }

        if (state == InternetState.gained &&
            _wasDisconnected &&
            widget.onRetry != null) {
          _wasDisconnected = false; // reset
          widget.onRetry!(); // retry API only after reconnect
        }
      },
      child: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state == InternetState.lost) {
            return NoInternetScreen(onRetry: widget.onRetry ?? () {});
          }
          return widget.child;
        },
      ),
    );
  }
}
