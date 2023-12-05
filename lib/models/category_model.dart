import 'package:uuid/uuid.dart';

class Category {
  final String id;
  final String name;

  Category({
    required this.name,
  }) : id = const Uuid().v4();
}