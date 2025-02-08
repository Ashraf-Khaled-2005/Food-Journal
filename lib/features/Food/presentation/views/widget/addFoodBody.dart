import 'dart:math';

import 'package:flutter/material.dart';

import 'CustomTextField.dart';
import 'custombuttom.dart';

class AddFoodBody extends StatelessWidget {
  const AddFoodBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.5,
            child: Image.asset("assets/download.jpg"),
          ),
          Center(child: CustomTextField()),
          SizedBox(
            height: 35,
          ),
          CustomButton(
            text: "Done",
            onPressed: () {
              // Add food to database
            },
          ),
        ],
      ),
    );
  }
}
