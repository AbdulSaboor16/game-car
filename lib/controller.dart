import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AvatarController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  String? imageUrl;

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }

  Future<void> uploadImage() async {
    if (image.value == null) {
      // Handle the case when no image is selected.
      return;
    }

    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

    final UploadTask uploadTask = storageReference.putFile(image.value!);

    await uploadTask.whenComplete(() async {
      imageUrl = await storageReference.getDownloadURL();
      print(imageUrl);
      update();
      print('Image uploaded successfully. URL: $imageUrl');
      // You can handle the imageUrl as needed, e.g., save it to a database.
    }).catchError((onError) {
      print('Image upload failed: $onError');
      print('image is select');
    });
  }
}

class HomeController extends GetxController {
  RxList empl = [].obs;
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  var itemCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nameTextEditingController.dispose();
    addressTextEditingController.dispose();
  }

  addEmployee(String name, String address) {
    addEmployee(name, address);
    empl.value.add(addEmployee(name, address));
    itemCount.value = addEmployee(name, address).value.length;
  }
}
