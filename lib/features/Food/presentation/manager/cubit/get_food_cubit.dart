import 'package:bloc/bloc.dart';
import 'package:food_daily/features/Food/data/dataSource/localData.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/food_entity.dart';

part 'get_food_state.dart';

class GetFoodCubit extends Cubit<GetFoodState> {
  final LocalData local;
  GetFoodCubit(this.local) : super(GetFoodInitial());

  void getfood() {
    emit(GetFoodLoading());
    try {
      final foodList = local.getData();
      emit(GetFoodSuccess(foodList));
    } catch (e) {
      emit(GetFoodFailure(e.toString()));
    }
  }

  void setfood({required FoodEntity fooditem}) {
    FoodEntity food = FoodEntity(
      data: DateTime.now().toString(),
      description: fooditem.description,
      imageUrl: fooditem.imageUrl,
    );
    var box = Hive.box<FoodEntity>("foods");
    box.add(food);
    getfood();
  }
}
