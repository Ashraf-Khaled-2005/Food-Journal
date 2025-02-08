import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(
        "21/2/2025",
        style: TextStyle(color: Colors.grey),
      ),
      leading: Image.asset('assets/download.jpg'),
      title: Text(
        'Food name',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Food description',
        style: TextStyle(color: Colors.grey),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
