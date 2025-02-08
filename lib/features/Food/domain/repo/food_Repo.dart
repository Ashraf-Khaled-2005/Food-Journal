import 'package:dartz/dartz.dart';
import 'package:food_daily/features/Food/domain/entity/food_entity.dart';

abstract class FoodRepo {
  Future<Either<Failure, List<FoodEntity>>> getListData();
}

class Failure {
  final String err;

  Failure({required this.err});
}
