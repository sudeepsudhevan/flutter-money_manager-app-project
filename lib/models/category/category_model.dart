import 'package:hive_flutter/hive_flutter.dart';
part 'category_model.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeleted;

  @HiveField(3)
  final CategoryType type;

  CategoryModel({
    required this.id,
    required this.name,
    required this.type,
    this.isDeleted = false,
  });
}

//flutter pub run build_runner build watch -use-polling-watcher --delete-conflicting-outputs

// dart run build_runner watch --use-polling-watcher --delete-conflicting-outputs
