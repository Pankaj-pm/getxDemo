import 'package:get/get.dart';
import 'package:getxstatemanagement/model/product_model.dart';

class CartController extends GetxController {
  RxList<ProductModel> productCartList = <ProductModel>[].obs;

  Rx<ProductModel> pm=ProductModel().obs;


  void addProduct(ProductModel model) {
    if (productCartList.contains(model) == false) {
      productCartList.add(model);
    }
  }

  void removeProduct(int modelindex) {
    productCartList.removeAt(modelindex);
  }
}
