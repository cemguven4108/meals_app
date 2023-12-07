import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/widgets/custom_gridview.dart';
import 'package:meals_app/widgets/meal_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorites"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return CustomGridview(
            children: [
              ...favorites.map((meal) {
                return MealCard(meal: meal);
              }),
            ],
          );
        },
      ),
    );
  }
}
