import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos una lista de datos de ejemplo
    final List<String> items = List.generate(30, (i) => "Elemento de la lista #${i + 1}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("🧾 Listas (ListView)", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("💡 Muestran colecciones de datos de forma eficiente.", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        // ListView.builder es el equivalente a RecyclerView
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.star),
                title: Text(items[index]),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Pulsado: ${items[index]}')),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}