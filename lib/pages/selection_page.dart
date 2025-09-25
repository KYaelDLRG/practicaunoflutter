import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool _isChecked = false;
  bool _isSwitched = false;
  int? _radioValue = 1;
  String _statusText = "Resultados aparecerán aquí.";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("✅ Elementos de Selección", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("💡 Permiten al usuario elegir entre diferentes opciones o estados.", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          const Text("⚡ Demostración Interactiva", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          CheckboxListTile(
            title: const Text("Acepto los términos"),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          ),
          SwitchListTile(
            title: const Text("Activar notificaciones"),
            value: _isSwitched,
            onChanged: (bool value) {
              setState(() {
                _isSwitched = value;
              });
            },
          ),
          Row(
            children: [
              Radio<int>(value: 1, groupValue: _radioValue, onChanged: (int? value) => setState(() => _radioValue = value)),
              const Text("Opción A"),
              Radio<int>(value: 2, groupValue: _radioValue, onChanged: (int? value) => setState(() => _radioValue = value)),
              const Text("Opción B"),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                final terminos = _isChecked ? "Sí" : "No";
                final notificaciones = _isSwitched ? "Activadas" : "Desactivadas";
                final opcion = _radioValue == 1 ? "Opción A" : "Opción B";
                _statusText = "Términos: $terminos\nNotificaciones: $notificaciones\nOpción: $opcion";
              });
            },
            child: const Text("Verificar Estado"),
          ),
          const SizedBox(height: 16),
          Text(_statusText, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}