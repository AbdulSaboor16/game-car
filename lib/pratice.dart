import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pratice/controller.dart';

class Pratice extends StatelessWidget {
  final controller = Get.put(AvatarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Avatar Picker using GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => CircleAvatar(
                radius: 80,
                backgroundImage: controller.image.value != null
                    ? FileImage(controller.image.value!)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.pickImage,
              child: Text('Select Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: controller.uploadImage,
              child: Text('Upload Image to Firebase Storage'),
            ),
            Image.network(
                'https://firebasestorage.googleapis.com/v0/b/practiceimage-4dd0f.appspot.com/o/1694194834949.jpg?alt=media&token=0926d0d4-1c30-4c19-a92a-d924798f38e5')
          ],
        ),
      ),
    );
  }
}
