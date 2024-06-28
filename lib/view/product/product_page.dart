import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatemanagement/controller/cart_controller.dart';
import 'package:getxstatemanagement/controller/product_controller.dart';
import 'package:getxstatemanagement/model/product_model.dart';
import 'package:getxstatemanagement/view/cart_page/cart_page.dart';

class ProductPage extends StatelessWidget {
  final TextEditingController productTextEditingController = TextEditingController();

  CartController cartController = Get.put(CartController());

  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(() {
              return Badge(
                label: Text("${cartController.productCartList.length}"),
                offset: Offset(-5, 1),
                isLabelVisible: cartController.productCartList.isNotEmpty,
                child: IconButton(
                  onPressed: () {
                    Get.to(() => CartPage());
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              );
            }),
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            controller: productTextEditingController,
            onFieldSubmitted: (value) {
              ProductModel product = ProductModel(name: value, qty: 0);
              Get.find<ProductController>().productList.add(product);
              productTextEditingController.clear();
            },
          ),
          Expanded(
            child: GetX<ProductController>(
              init: ProductController(),
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    var product = controller.productList[index];
                    return ListTile(
                      title: Text(product.name ?? ""),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                product.qty = (product.qty ?? 0) - 1;
                                controller.productList.refresh();
                              },
                              icon: Icon(Icons.remove_circle)),
                          Text("${product.qty}".padLeft(2,"0")),
                          IconButton(
                              onPressed: () {
                                product.qty = (product.qty ?? 0) + 1;
                                controller.productList.refresh();
                              },
                              icon: Icon(Icons.add_circle)),
                          IconButton(
                              onPressed: () {
                                Get.find<CartController>().addProduct(product);
                              },
                              icon: Icon(Icons.add_shopping_cart)),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
