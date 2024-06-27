import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getxstatemanagement/controller/home_controller.dart';

class CartPage extends StatelessWidget {

  HomeController homeController = Get.find<HomeController>();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print("Get.isDarkMode ${Get.isDarkMode}");
              Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
            icon: Icon(Icons.light),
          ),
          IconButton(
            onPressed: () {
              print("${homeController.count}");
              Get.back();
            },
            icon: Icon(Icons.notification_add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: homeController.count.value,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Product"),
                  );
                },
              );
            }),
          ),
          ElevatedButton(
              onPressed: () {
                homeController.count--;
                Get.back();
                Get.snackbar(
                  "Back",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(milliseconds: 800),
                );


              },
              child: Icon(Icons.remove))
        ],
      ),
    );
  }
}
