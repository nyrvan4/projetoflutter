import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../item_detail/views/item_detail_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  const CategoryDetailScreen({Key? key, required this.category}) : super(key: key);

  Future<List<dynamic>> loadMenuItems() async {
    try {
      final String response = await rootBundle.loadString('lib/data/menu_items.json');
      return json.decode(response);
    } catch (e) {
      throw Exception('Erro ao carregar o menu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: loadMenuItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os itens: ${snapshot.error}'));
          }

          final menuItems = snapshot.data!;
          // Encontre a categoria correspondente no JSON
          final categoryData = menuItems.firstWhere((cat) => cat['category'] == category, orElse: () => null);
          
          if (categoryData == null) {
            return Center(child: Text('Categoria não encontrada'));
          }

          final items = categoryData['items'];
          
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]['name']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetailScreen(item: items[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}