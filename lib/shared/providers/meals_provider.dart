import 'package:flutter_meal_app/core/data/meals_dummy_data.dart';
import 'package:flutter_meal_app/shared/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) => mealsDummyData);

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filtersMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (selectedFilters[Filter.gluttenFree]! && !meal.isGlutenFree) {
      return false;
    }

    if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }

    return true;
  }).toList();
});
