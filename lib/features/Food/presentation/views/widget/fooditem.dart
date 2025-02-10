import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_daily/features/Food/domain/entity/food_entity.dart';
import 'package:intl/intl.dart';

class FoodItem extends StatelessWidget {
  final FoodEntity item;
  const FoodItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(item.data);
    return ListTile(
      trailing: Text(
        DateFormat('').format(parsedDate),
        style: TextStyle(color: Colors.grey),
      ),
      leading: Image.file(File(item.imageUrl)),
      title: Text(
        item.description,
        style: TextStyle(color: Colors.grey),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
