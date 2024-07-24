
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mitt_shop/controllers/search_controllers.dart';

import '../widgets/product_card.dart';

class SearchPage extends StatelessWidget {
  final SearchControllers searchController = Get.put(SearchControllers());

   SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Search products...'),
          onSubmitted: (query) => searchController.searchProducts(query),
        ),
      ),
      body: Obx(() {
        if (searchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: searchController.searchResults.length,
            itemBuilder: (context, index) {
              return ProductCard(product: searchController.searchResults[index]);
            },
          );
        }
      }),
    );
  }
}
