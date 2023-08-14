import 'package:flutter/material.dart';
import 'package:flutter_meal_app/shared/models/meal.dart';
import 'package:flutter_meal_app/shared/providers/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              bool isfav = ref
                  .read(favoriteMealProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isfav ? 'Meal Added!' : 'Meal Removed!'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 300,
              ),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: meal.id,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Ingredients',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Steps',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
