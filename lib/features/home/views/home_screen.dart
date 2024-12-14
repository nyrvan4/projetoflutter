import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../widgets/category_card.dart';
import '../../shared/drawer/side_drawer.dart';

class HomeScreen extends StatelessWidget {
  Future<List<dynamic>> loadMenuItems() async {
    try {
      final String response = await rootBundle.loadString('lib/data/menu_items.json');
      return json.decode(response);
    } catch (e) {
      throw Exception('Erro ao carregar categorias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bem-vindo à Lanchonete')),
      drawer: SideDrawer(),
      body: FutureBuilder<List<dynamic>>(
        future: loadMenuItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar as categorias: ${snapshot.error}'));
          }

          final menuItems = snapshot.data!;
          return Column(
            children: [
              const Text('Escolha uma categoria', style: TextStyle(fontSize: 24)),
              Expanded(
                child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(category: menuItems[index]['category']);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}