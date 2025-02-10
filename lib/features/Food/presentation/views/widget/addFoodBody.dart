import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_daily/features/Food/domain/entity/food_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../manager/cubit/get_food_cubit.dart';
import 'CustomTextField.dart';
import 'custombuttom.dart';

class AddFoodBody extends StatefulWidget {
  final File? image;
  const AddFoodBody({super.key, required this.image});

  @override
  State<AddFoodBody> createState() => _AddFoodBodyState();
}

class _AddFoodBodyState extends State<AddFoodBody> {
  bool isloading = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.5,
            child: widget.image != null
                ? Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          widget.image!,
                          fit: BoxFit.cover,
                        )),
                  )
                : SizedBox(),
          ),
          SizedBox(
            height: 15,
          ),
          Center(child: CustomTextField(controller: controller)),
          SizedBox(
            height: 35,
          ),
          isloading == true
              ? Center(child: CircularProgressIndicator())
              : CustomButton(
                  text: "Done",
                  onPressed: () async {
                    setState(() {
                      isloading = true;
                    });
                    if (widget.image != null) {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      final String path =
                          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

                      final File newImage =
                          await File(widget.image!.path).copy(path);
                      BlocProvider.of<GetFoodCubit>(context).setfood(
                          fooditem: FoodEntity(
                              description: controller.text,
                              imageUrl: path,
                              data: DateTime.now().toString()));
                      Navigator.pop(context);
                    }
                  },
                ),
        ],
      ),
    );
  }
}
