import 'package:flutter/material.dart';

import 'widget/homebody.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
