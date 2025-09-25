import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  double _progressValue = 0.3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("ℹ️ Elementos de Información", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("💡 Muestran información al usuario como imágenes y barras de progreso.", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          const Text("⚡ Demostración Interactiva", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Center(
            child: Image.network('https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png', width: 100),
          ),
          const SizedBox(height: 24),
          LinearProgressIndicator(value: _progressValue),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _progressValue += 0.1;
                if (_progressValue > 1.0) {
                  _progressValue = 0.0;
                }
              });
            },
            child: const Text("Aumentar Progreso"),
          ),
        ],
      ),
    );
  }
}