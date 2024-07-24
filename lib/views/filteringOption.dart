import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controllers.dart';


class FilterPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter & Sort'),
      ),
      body: Column(
        children: [
          // Sort Options
          ListTile(
            title: const Text('Sort by Price'),
            onTap: () => productController.setSortOption('price'),
          ),
          ListTile(
            title: const Text('Sort by Popularity'),
            onTap: () => productController.setSortOption('popularity'),
          ),
          ListTile(
            title: const Text('Sort by Rating'),
            onTap: () => productController.setSortOption('rating'),
          ),

          // Filter Options
          ListTile(
            title: const Text('Category: Electronics'),
            onTap: () => productController.setCategory('electronics'),
          ),
          ListTile(
            title: const Text('Category: Fashion'),
            onTap: () => productController.setCategory('fashion'),
          ),

          // Price Range
          ListTile(
            title: const Text('Price Range: 0 - 50'),
            onTap: () => productController.setPriceRange('0-50'),
          ),
          ListTile(
            title: const Text('Price Range: 50 - 100'),
            onTap: () => productController.setPriceRange('50-100'),
          ),

          // Ratings
          ListTile(
            title: const Text('Rating: 4 stars & up'),
            onTap: () => productController.setRating('4'),
          ),
          ListTile(
            title: const Text('Rating: 5 stars'),
            onTap: () => productController.setRating('5'),
          ),
        ],
      ),
    );
  }
}
