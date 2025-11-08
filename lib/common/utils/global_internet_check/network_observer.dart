import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/placeholder/no_internet.dart';
import 'internet_cubit.dart';

class NetworkObserver extends StatelessWidget {
  final Widget child;
  final VoidCallback? onRetry;

  const NetworkObserver({super.key, required this.child, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state == InternetState.gained && onRetry != null) {
          onRetry!(); // Call screen’s API again on reconnect
        }
      },
      child: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state == InternetState.lost) {
            return NoInternetScreen(onRetry: onRetry ?? () {});
          }
          return child;
        },
      ),
    );
  }
}
