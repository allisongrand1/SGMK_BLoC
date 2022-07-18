
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/theme/theme.dart';
import 'models/pizza.dart';
import 'pages/bloc/home_page_bloc.dart';
import 'pages/home_page/home_page.dart';
import 'pages/new-pizza_page/new-pizza_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => HomePageBloc()
        ..add(LoadHomePage(pizzas: [
          Pizza(title: "Original", amount: '8', image: ''),
          Pizza(title: "Buffalo", amount: '10', image: ''),
          Pizza(title: "San Marzano", amount: '6', image: ''),
          Pizza(title: "Pepperoni", amount: '11', image: ''),
          Pizza(title: "Mexican", amount: '13', image: '')
        ])),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/pageB': (context) => NewPizza(),
      },
      initialRoute: '/',
    );
  }
}
