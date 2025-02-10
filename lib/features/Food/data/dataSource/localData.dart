import 'dart:developer';

import 'package:hive/hive.dart';

import '../../domain/entity/food_entity.dart';

abstract class LocalData {
  List<FoodEntity> getData();
}

class LocalDataImple extends LocalData {
  @override
  List<FoodEntity> getData() {
    var box = Hive.box<FoodEntity>('foods');
    List<FoodEntity> foodList = [];
    for (var i = 0; i < box.length; i++) {
      foodList.add(box.getAt(i)!);
    }
    log("Data fetched from local storage ${foodList.length}");
    foodList.sort((a, b) {
      // Convert date strings to DateTime objects for comparison
      DateTime dateA = DateTime.parse(a.data);
      DateTime dateB = DateTime.parse(b.data);

      // Compare the DateTime objects
      return dateA.compareTo(dateB); // ascending order (earliest first)
    });
    return foodList;
  }
}
