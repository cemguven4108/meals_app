import 'package:flutter/material.dart';
import 'package:meals_app/data/meal_data.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/services/category_service.dart';
import 'package:meals_app/services/meal_service.dart';
import 'package:meals_app/widgets/meal_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Meal> _mealList = MealService().findAll();

  List<Widget> buildCategories() {
    final categoryService = CategoryService();
    final categoryList = categoryService.findAll();

    return categoryList.map((category) {
      return Card(
        child: ListTile(
          onTap: () {
            setState(() {
              _mealList = MealService().findAllByCategoryId(category.id);
            });
            Navigator.of(context).pop();
          },
          title: Text(category.name),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Meals App"),
      ),
      drawer: Drawer(

        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Categories"),
            ),
            ...buildCategories(),
          ],
        ),
      ),
      body: MealView(
        mealList: _mealList,
      ),
    );
  }
}
