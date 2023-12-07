import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class Category {
  final String id;
  final String name;

  Category({
    required this.name,
  }) : id = const Uuid().v4();

  // Category copy({required String name}) {
  //   return Category(
  //     name: name,
  //   );
  // }
}