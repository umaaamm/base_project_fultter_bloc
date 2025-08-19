import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/counter/presentation/bloc/counter_bloc.dart';
import 'core/di/service_locator.dart';
import 'features/counter/domain/repositories/counter_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(sl<CounterRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'BLoC Starter',
        theme: AppTheme.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.counter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
