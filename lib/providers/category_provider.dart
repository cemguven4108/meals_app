import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/models/category_model.dart';

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>>(
  (_) => CategoryNotifier(),
);

class CategoryNotifier extends StateNotifier<List<Category>> {
  CategoryNotifier() : super(categoryList);

  void addCategory(Category category) {
    final isDuplicate = state.any((element) => element.name == category.name);
    if (!isDuplicate) {
      state = [...state, category];
    }
  }

  // void update(Category category) {
  //   state = state.map((thisCategory) {
  //     return thisCategory.id == category.id
  //         ? thisCategory.copy(name: category.name)
  //         : thisCategory;
  //   }).toList();
  // }

  // void delete(Category category) {
  //   final isValid = state.any((element) => element.id == category.id);
  //   if (isValid) {
  //     state = state.where((element) => element.id != category.id).toList();
  //   }
  // }
}
