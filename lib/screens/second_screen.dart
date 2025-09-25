import 'package:flutter/material.dart';
import 'package:practicaunoflutter/pages/info_page.dart';
import 'package:practicaunoflutter/pages/list_page.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    ListPage(),
    InfoPage(),
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
        title: const Text('Componentes Avanzados'),
        backgroundColor: Colors.teal,
        // Flutter añade la flecha de regreso automáticamente aquí
      ),
      body: Column(
        children: [
          Expanded(child: _pages.elementAt(_selectedIndex)),
          // Botón explícito para regresar, como pediste
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {
                  // Así se regresa a la pantalla anterior
                  Navigator.pop(context);
                },
                child: const Text("Regresar al Primer Activity"),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listas'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}