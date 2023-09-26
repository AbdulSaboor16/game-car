import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pratice/controller.dart';

class Customtext extends StatelessWidget {
  const Customtext({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: controller.nameTextEditingController,
              decoration: const InputDecoration(
                hintText: 'Address',
                labelText: "Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            TextField(
              controller: controller.addressTextEditingController,
              decoration: const InputDecoration(
                hintText: 'Address',
                labelText: "Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.addEmployee(
                      controller.nameTextEditingController.text,
                      controller.addressTextEditingController.text);
                },
                child: Text("data add")),

              Text(controller.nameTextEditingController.text),
              Text(controller.addressTextEditingController.text)
          ],
        ),
      ),
    );
  }
}
