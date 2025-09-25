import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  String _inputText = "El texto aparecerá aquí";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("📝 Campos de Texto (TextField)", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("💡 Permiten al usuario introducir y editar texto. Son esenciales para formularios y búsquedas.", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          const Text("⚡ Demostración Interactiva", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                _inputText = value.isEmpty ? "El texto aparecerá aquí" : value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Escribe algo aquí',
            ),
          ),
          const SizedBox(height: 16),
          Text(_inputText, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}