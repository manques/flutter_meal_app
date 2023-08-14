import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_meal_app/screens/categories/categories_screen.dart';
import 'package:flutter_meal_app/screens/filters/filters_screen.dart';
import 'package:flutter_meal_app/screens/meals/meals_screen.dart';
import 'package:flutter_meal_app/shared/widgets/main_drawer.dart';
import 'package:flutter_meal_app/shared/providers/meals_provider.dart';
import 'package:flutter_meal_app/shared/providers/favorite_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filtersMealsProvider);

    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var selectedTitle = "Pick Your Category";

    if (_selectedScreenIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealProvider);
      activeScreen = MealsScreen(
        meals: favoriteMeals,
      );
      selectedTitle = 'Favorite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
