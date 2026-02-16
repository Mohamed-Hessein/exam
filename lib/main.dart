import 'package:exam/cubit/cubit.dart';
import 'package:exam/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_screen.dart';

void main() {
  runApp(BlocProvider(

      create: (context) => ProductCubit()..getProudct(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         initialRoute: Home.routeName,
      routes: {
        Home.routeName : (context) => Home(),
        CartScreen.routeName : (context) => CartScreen()

      },
    );
  }
}
