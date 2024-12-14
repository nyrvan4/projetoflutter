import 'package:flutter/material.dart';
import '../../category_detail/views/category_detail_screen.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(category),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailScreen(category: category),
            ),
          );
        },
      ),
    );
  }
}