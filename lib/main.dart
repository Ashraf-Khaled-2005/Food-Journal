import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_daily/features/Food/data/dataSource/localData.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/Food/domain/entity/food_entity.dart';
import 'features/Food/presentation/manager/cubit/get_food_cubit.dart';
import 'features/Food/presentation/views/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FoodEntityAdapter());
  await Hive.openBox<FoodEntity>('foods');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFoodCubit(LocalDataImple())..getfood(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}
