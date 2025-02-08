import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_daily/core/func/image_picker.dart';

import 'widget/addFoodBody.dart';

class AddFood extends StatelessWidget {
  const AddFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Floating_AddItem(),
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

class Floating_AddItem extends StatefulWidget {
  const Floating_AddItem({
    super.key,
  });

  @override
  State<Floating_AddItem> createState() => _Floating_AddItemState();
}

class _Floating_AddItemState extends State<Floating_AddItem> {
  File? image;
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          spacing: 5,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Camera"),
              onTap: () async {
                File? pickedImage = await selectImage(choice: 0);
                log(pickedImage.toString());
                if (pickedImage != null) {
                  image = pickedImage;
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () async {
                File? pickedImage = await selectImage(choice: 1);
                if (pickedImage != null) {
                  setState(() {
                    image = pickedImage;
                  });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        showImagePicker(context);
      },
      child: Icon(
        Icons.image_search_rounded,
        color: Colors.white,
      ),
    );
  }
}
