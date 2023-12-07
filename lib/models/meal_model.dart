import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class Meal {
  final String id;
  final String categoryId;
  final String name;
  final String imageUrl;
  final List<String> ingredients;

  Meal({
    required this.categoryId,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
  }) : id = const Uuid().v4();
}