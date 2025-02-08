import 'package:dartz/dartz.dart';
import 'package:food_daily/features/Food/data/dataSource/localData.dart';
import 'package:food_daily/features/Food/domain/entity/food_entity.dart';
import 'package:food_daily/features/Food/domain/repo/food_Repo.dart';

class FoodRepoImpl extends FoodRepo {
  final LocalData localData;

  FoodRepoImpl({required this.localData});
  @override
  Future<Either<Failure, List<FoodEntity>>> getListData() async {
    try {
      List<FoodEntity> list = await localData.getData();
      if (list.isEmpty) {
        return Left(Failure(err: 'Data is empty'));
      }
      return Right(list);
    } on Exception catch (e) {
      return Left(Failure(err: e.toString()));
    }
  }
}
