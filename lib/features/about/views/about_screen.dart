import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Membros do Grupo:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const Text('• Nyrvana Silva\n• João Gabriel Marques\n• Nayara Diniz', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text('Objetivo da Aplicação:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            const Text('Criar uma experiência de pedido fácil e rápida.', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}