import 'package:flutter/material.dart';

import 'package:calculator_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/calculator_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeScreen(),
      ),
    );
  }
}
