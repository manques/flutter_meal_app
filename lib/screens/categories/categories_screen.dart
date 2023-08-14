import 'package:flutter/material.dart';
import 'package:flutter_meal_app/shared/widgets/category_item.dart';
import 'package:flutter_meal_app/core/data/categories_dummy_data.dart';
import 'package:flutter_meal_app/screens/meals/meals_screen.dart';
import 'package:flutter_meal_app/shared/models/category.dart';

import 'package:flutter_meal_app/shared/models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // ...availableCategories
          //     .map(
          //       (category) => CategoryItem(
          //         category: category,
          //         onSelectCategory: () =>{
          //            _selectCategory(context);
          //         }
          //       ),
          //     )
          //     .toList()
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),

      // builder: (context, child) => SlideTransition(
      //   position: _animationController.drive(
      //     Tween(
      //       begin: const Offset(0, 0.3),
      //       end: const Offset(0, 0),
      //     ),
      //   ),
      //   child: child,
      // ),

      // builder: (context, child) => Padding(
      //   padding: EdgeInsets.only(
      //     top: 100 - _animationController.value * 100,
      //   ),
      //   child: child,
      // ),
    );
  }
}
