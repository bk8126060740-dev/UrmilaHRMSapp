import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/utils/app_bloc/app_bloc.dart';
import '../common/utils/constants/constants.dart';
import '../common/utils/download_feature/bloc/download_bloc.dart';
import '../common/utils/global_internet_check/internet_cubit.dart';
import '../common/utils/hive/hive_service.dart';

class AppDependencies extends StatelessWidget {
  final Widget child;

  const AppDependencies({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetCubit()),
        BlocProvider(
          create: (_) => AppBloc()
            ..add(
              AppEvent.updateLoginResponse(HiveService.read(AppConstant.kLoginResponseKey)),
            ),
        ),
        BlocProvider(create: (_) => DownloadBloc()),
      ],
      child: child,
    );
  }
}
