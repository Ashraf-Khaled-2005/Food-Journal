import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_daily/features/Food/presentation/manager/cubit/get_food_cubit.dart';

import 'FoodsListListView.dart';
import 'fooditem.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFoodCubit, GetFoodState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetFoodLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetFoodSuccess) {
          return FoodsListListView(
            list: state.foodList,
          );
        } else if (state is GetFoodFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        return Text("Error");
      },
    );
  }
}
