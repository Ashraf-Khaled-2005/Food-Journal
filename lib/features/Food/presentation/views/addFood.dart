import 'dart:io';

import 'package:flutter/material.dart';
import 'widget/addFoodBody.dart';
import 'widget/floatingbuttom.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          File? pickedImage = await showImagePicker(context);

          if (pickedImage != null) {
            print("Image is not null");
          } else {
            print("NULL");
          }
        },
        child: Icon(
          Icons.image_search_rounded,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add food",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: AddFoodBody(),
      ),
    );
  }
}
