import 'package:dartz/dartz.dart';
import 'package:food_daily/features/Food/domain/entity/food_entity.dart';

abstract class FoodRepo {
  List<Either<Failure, List<FoodEntity>>> getData();
}

class Failure {
  final String err;

  Failure({required this.err});
}
