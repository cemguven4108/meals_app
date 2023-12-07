import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("/meals", arguments: category);
        },
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade800.withOpacity(0.8),
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepOrange.shade800.withOpacity(0.7),
              ],
            ),
          ),
          child: Center(
            child: Text(
              category.name,
            ),
          ),
        ),
      ),
    );
  }
}
