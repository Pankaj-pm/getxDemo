import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getxstatemanagement/controller/cart_controller.dart';
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
            child: GetX<CartController>(
              init: CartController(),
              initState: (_) {},
              builder: (cartController) {
                return ListView.builder(
                  itemCount: cartController.productCartList.length,
                  itemBuilder: (context, index) {
                    var product = cartController.productCartList[index];
                    return ListTile(
                      title: Text(product.name ?? ""),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)),
                          Text("${product.qty}"),
                          IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
                          IconButton(
                              onPressed: () {
                                cartController.removeProduct(index);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
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
