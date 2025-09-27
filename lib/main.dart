
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocius_cart/ApiServices.dart';


import 'package:ocius_cart/Screens/Home.dart';
import 'package:ocius_cart/bloc/cart_bloc.dart';
import 'package:ocius_cart/bloc/product_bloc.dart';
import 'package:ocius_cart/bloc/product_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(
            apiService: ApiService(),
          )..add(LoadProducts()),
        ),
        // Cart BLoC provider
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

