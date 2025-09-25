import 'package:flutter/material.dart';
import 'package:practicaunoflutter/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PracticaUno Flutter',
      // ThemeData solo se declara una vez
      theme: ThemeData(
        // Todos los parámetros van dentro de este constructor
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // La pantalla de inicio de nuestra app
      home: const MainScreen(),
    );
  }
}