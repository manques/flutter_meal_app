import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data/categories_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: categoriesData
            .map(
              (category) => Text(
                category.title.toString(),
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: category.color,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
