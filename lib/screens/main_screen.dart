import 'package:flutter/material.dart';
// Importaciones a las páginas que va a mostrar
import 'package:practicaunoflutter/pages/button_page.dart';
import 'package:practicaunoflutter/pages/selection_page.dart';
import 'package:practicaunoflutter/pages/text_field_page.dart';
// Importación a la segunda pantalla para la navegación
import 'package:practicaunoflutter/screens/second_screen.dart';

// Asegúrate de que el nombre de la clase sea exactamente "MainScreen"
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    TextFieldPage(),
    ButtonPage(),
    SelectionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Básicos'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(child: _pages.elementAt(_selectedIndex)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text("Ver Segundo Activity"),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Textos'),
          BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: 'Botones'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Selección'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}