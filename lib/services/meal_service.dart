import 'package:meals_app/data/meal_data.dart';
import 'package:meals_app/models/meal_model.dart';

class MealService {

  void add(Meal meal) {

  }

  Meal findOne(String id) {
    return mealList.firstWhere((element) => element.id == id);
  }

  List<Meal> findAll() {
    return mealList;
  }

  List<Meal> findAllByCategoryId(String categoryId) {
    return mealList.where((element) => element.categoryId == categoryId).toList();
  }
}