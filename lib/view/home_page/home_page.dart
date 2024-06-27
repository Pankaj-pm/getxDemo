import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getxstatemanagement/controller/home_controller.dart';
import 'package:getxstatemanagement/view/cart_page/cart_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          Obx(
            () => Switch(
              value: controller.isDark.value,
              onChanged: (value) {
                Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                controller.isDark.value = !Get.isDarkMode;
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() {
              return Text(
                '${controller.count.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            ElevatedButton(
                onPressed: () {
                  controller.count++;
                  Get.snackbar(
                    "Success",
                    "Count ++",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(milliseconds: 800),
                  );
                },
                child: Icon(Icons.add)),
            ElevatedButton(
                onPressed: () {
                  controller.count--;
                },
                child: Icon(Icons.remove))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CartPage());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
