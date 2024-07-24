import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

import '../controllers/product_controllers.dart';
import '../widgets/product_card.dart';
import 'filteringOption.dart';


class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.toNamed('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.toNamed('/cart'),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => Get.to(() => FilterPage()), // Navigate to FilterPage
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.find<AuthController>().logout();
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value && productController.page.value == 1) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!productController.isLoading.value &&
                  !productController.isLoadMore.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                productController.fetchProducts();
              }
              return true;
            },
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust number of columns as needed
                      childAspectRatio: 0.75, // Adjust card aspect ratio as needed
                    ),
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: productController.productList[index]);
                    },
                  ),
                ),
                if (productController.isLoadMore.value)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        }
      }),
    );
  }
}
