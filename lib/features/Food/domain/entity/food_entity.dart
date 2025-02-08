import 'package:hive/hive.dart';

part 'food_entity.g.dart';

@HiveType(typeId: 0)
class FoodEntity extends HiveObject {
  @HiveField(0)
  final String description;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String data; // Changed 'Data' to 'data' for convention

  FoodEntity({
    required this.description,
    required this.imageUrl,
    required this.data,
  });
}
