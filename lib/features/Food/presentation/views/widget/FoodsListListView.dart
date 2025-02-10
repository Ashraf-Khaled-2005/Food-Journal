import 'package:flutter/material.dart';
import 'package:food_daily/features/Food/domain/entity/food_entity.dart';

import 'fooditem.dart';

class FoodsListListView extends StatelessWidget {
  final List<FoodEntity> list;
  const FoodsListListView({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(
            child: Text("No Food Found"),
          )
        : ListView.separated(
            itemCount: list.length,
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Divider(),
            ),
            itemBuilder: (context, index) {
              return FoodItem(
                item: list.elementAt(index),
              );
            },
          );
  }
}
