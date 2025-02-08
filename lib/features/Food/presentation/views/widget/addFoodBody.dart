import 'dart:math';

import 'package:flutter/material.dart';

import 'CustomTextField.dart';

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

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color = Colors.blue, // Default button color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Adjust height as needed
      width: double.infinity, // Makes it expand to full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
