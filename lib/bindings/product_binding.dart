
import 'package:get/get.dart';

import '../controllers/product_controllers.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
