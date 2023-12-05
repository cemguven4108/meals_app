import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_widget.dart';

class MealView extends StatelessWidget {
  const MealView({
    super.key,
    required this.mealList,
  });

  final List<Meal> mealList;

  List<MealWidget> buildMealList() {
    return mealList.map((meal) {
      return MealWidget(meal: meal);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 2,
      ),
      children: <Widget>[
        ...buildMealList(),
      ],
    );
  }
}
