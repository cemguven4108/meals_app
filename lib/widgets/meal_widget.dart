import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(35),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800.withOpacity(0.8),
              Colors.deepPurple.shade800.withOpacity(0.8),
            ]),
      ),
      child: Text(
        meal.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
