import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/injection_container.dart';
import 'package:movie_app/presentation/navigation/app_router.dart';
import 'package:movie_app/presentation/screens/detail/detail_screen_cubit.dart';
import 'package:movie_app/presentation/screens/home/home_screen_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocator();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Orientation Demo';

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeScreenCubit>()),
        BlocProvider(create: (_) => locator<DetailScreenCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent
          )
        ),
      ),
    );
  }
}
