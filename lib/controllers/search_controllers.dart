// controllers/search_controller.dart
import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_services.dart';


class SearchControllers extends GetxController {
  var isLoading = false.obs;
  var searchResults = <Product>[].obs;

  void searchProducts(String query) async {
    try {
      isLoading(true);
      var products = await ApiService().fetchProductsByQuery(query);
      searchResults.value = products;
    } finally {
      isLoading(false);
    }
  }
}
