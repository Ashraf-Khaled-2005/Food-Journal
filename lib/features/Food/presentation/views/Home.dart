import 'package:flutter/material.dart';

import 'addFood.dart';
import 'widget/homebody.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddFood(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My food journal",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: HomeBody(),
    );
  }
}
