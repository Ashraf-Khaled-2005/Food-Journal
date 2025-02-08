import 'package:hive/hive.dart';

import '../../domain/entity/food_entity.dart';

abstract class LocalData {
  List<FoodEntity> getData();
}

class LocalDataImple extends LocalData {
  @override
  List<FoodEntity> getData() {
    var box = Hive.box('food');
    List<FoodEntity> foodList = [];
    for (var i = 0; i < box.length; i++) {
      foodList.add(FoodEntity(
        description: box.getAt(i)['description'],
        imageUrl: box.getAt(i)['imageUrl'],
        data: box.getAt(i)['data'],
      ));
    }
    return foodList;
  }
}
