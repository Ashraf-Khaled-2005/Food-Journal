import 'package:flutter/material.dart';

import 'fooditem.dart';

class FoodsListListView extends StatelessWidget {
  const FoodsListListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Divider(),
      ),
      itemBuilder: (context, index) {
        return FoodItem();
      },
    );
  }
}
