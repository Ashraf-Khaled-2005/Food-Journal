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
    return foodList;
  }
}
