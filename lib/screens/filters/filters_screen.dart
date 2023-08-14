import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_meal_app/shared/providers/meals_provider.dart';
import 'package:flutter_meal_app/shared/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filters',
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: currentFilters[Filter.gluttenFree]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.gluttenFree, isCheck);
            },
            title: Text(
              'Glute-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          // 2
          SwitchListTile(
            value: currentFilters[Filter.lactoseFree]!,
            onChanged: (isCheck) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isCheck);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          // 3
          SwitchListTile(
            value: currentFilters[Filter.vegetarian]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isCheck);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
          // 4
          SwitchListTile(
            value: currentFilters[Filter.vegan]!,
            onChanged: (isCheck) {
              ref
                  .refresh(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isCheck);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
        ],
      ),
    );
  }
}
