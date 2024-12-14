import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const ItemDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descrição: ${item['description']}', style: TextStyle(fontSize: 18)),
            Text('Preço: R\$ ${item['price'].toString()}', style: TextStyle(fontSize: 18)),
            Text('Tempo de espera: ${item['wait_time']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}