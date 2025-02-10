part of 'get_food_cubit.dart';

@immutable
sealed class GetFoodState {}

final class GetFoodInitial extends GetFoodState {}

final class GetFoodFailure extends GetFoodState {
  final String message;
  GetFoodFailure(this.message);
}

final class GetFoodSuccess extends GetFoodState {
  final List<FoodEntity> foodList;
  GetFoodSuccess(this.foodList);
}

final class GetFoodLoading extends GetFoodState {}
