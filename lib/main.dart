// Archivo: main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:peliculas/screens/home_screen.dart';
import 'package:peliculas/screens/details_screen.dart';
import 'package:peliculas/providers/movies_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProviders(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      theme: ThemeData.dark(),
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (_) => HomeScreen(),
        'details_screen': (_) => DetailsScreen(),
      },
    );
  }
}
