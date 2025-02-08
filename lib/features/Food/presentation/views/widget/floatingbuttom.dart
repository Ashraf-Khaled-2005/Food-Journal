import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_daily/core/func/image_picker.dart';

class Floating_AddItem extends StatefulWidget {
  const Floating_AddItem({super.key});

  @override
  State<Floating_AddItem> createState() => _Floating_AddItemState();
}

class _Floating_AddItemState extends State<Floating_AddItem> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () async {
        File? pickedImage = await showImagePicker(context);
        if (pickedImage != null) {
          setState(() {
            image = pickedImage;
          });
        }
      },
      child: const Icon(
        Icons.image_search_rounded,
        color: Colors.white,
      ),
    );
  }
}

Future<File?> showImagePicker(BuildContext context) async {
  File? image;
  await showModalBottomSheet(
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text("Camera"),
            onTap: () async {
              File? pickedImage = await selectImage(choice: 0);
              log("Picked from Camera: $pickedImage");
              Navigator.pop(context, pickedImage); // Return image
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Gallery"),
            onTap: () async {
              File? pickedImage = await selectImage(choice: 1);
              log("Picked from Gallery: $pickedImage");
              Navigator.pop(context, pickedImage); // Return image
            },
          ),
        ],
      );
    },
  ).then((value) {
    if (value != null) {
      image = value as File;
    }
  });

  return image;
}
