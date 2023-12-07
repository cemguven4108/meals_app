import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/custom_gridview.dart';
import 'package:meals_app/widgets/meal_card.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // get the Category from previous screen as argument
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(category.name),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final meals = ref
                .watch(mealProvider)
                .where((meal) => meal.categoryId == category.id)
                .toList();

            return CustomGridview(
              children: [
                ...meals.map((meal) {
                  return MealCard(
                    meal: meal,
                  );
                })
              ],
            );
          },
        ));
  }
}
