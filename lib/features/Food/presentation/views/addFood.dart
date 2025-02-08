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
  bool isloading = false;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          File? pickedImage = await showImagePicker(context);
          setState(() {
            isloading = true;
          });
          if (pickedImage != null) {
            image = pickedImage;
            setState(() {});
            print("Image is not null");
          } else {
            print("NULL");
          }
          setState(() {
            isloading = false;
          });
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
        child: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : AddFoodBody(
                image: image,
              ),
      ),
    );
  }
}
