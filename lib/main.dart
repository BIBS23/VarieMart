import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variemart/features/home/bloc/home_bloc.dart';
import 'package:variemart/features/products/bloc/product_bloc.dart';
import 'package:variemart/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(FetchHomeData()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: SplashView(),
      ),
    );
  }
}
