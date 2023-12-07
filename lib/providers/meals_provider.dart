import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meal_data.dart';
import 'package:meals_app/models/meal_model.dart';

final mealProvider = StateNotifierProvider<MealsNotifier, List<Meal>>(
  (_) => MealsNotifier(),
);

class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super(mealList);
}
