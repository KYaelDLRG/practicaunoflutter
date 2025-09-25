import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  String _statusText = "Esperando acción...";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("🎨 Botones", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("💡 Inician una acción cuando el usuario los toca. Pueden contener texto, un ícono o ambos.", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          const Text("⚡ Demostración Interactiva", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _statusText = "¡Botón de texto pulsado!";
                  });
                },
                child: const Text("Púlsame"),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  setState(() {
                    _statusText = "¡Botón de cámara pulsado!";
                  });
                },
                icon: const Icon(Icons.camera_alt),
                tooltip: "Botón de Cámara",
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(_statusText, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}