import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryService {
  void add(Category category) {
    categoryList.add(category);
  }

  Category findOne(String id) {
    return categoryList.firstWhere((element) => element.id == id);
  }

  List<Category> findAll() {
    return categoryList;
  }
}