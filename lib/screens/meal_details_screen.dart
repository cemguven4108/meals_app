import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.name),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                icon: Icon(favorites.contains(meal)
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  ref
                      .read(favoriteMealsProvider.notifier)
                      .update(meal);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
