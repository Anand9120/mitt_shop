import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var isLoadMore = false.obs;
  var productList = <Product>[].obs;
  var page = 1.obs;

  // Sorting and Filtering properties
  var sortOption = ''.obs;
  var category = ''.obs;
  var priceRange = ''.obs;
  var rating = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void setSortOption(String option) {
    sortOption.value = option;
    resetAndFetchProducts();
  }

  void setCategory(String cat) {
    category.value = cat;
    resetAndFetchProducts();
  }

  void setPriceRange(String range) {
    priceRange.value = range;
    resetAndFetchProducts();
  }

  void setRating(String rate) {
    rating.value = rate;
    resetAndFetchProducts();
  }

  void resetAndFetchProducts() {
    page.value = 1; // Reset page number for new filtering/sorting
    productList.clear(); // Clear current list to refresh
    fetchProducts();
  }

  void fetchProducts() async {
    if (page.value == 1) {
      isLoading(true);
    } else {
      isLoadMore(true);
    }
    try {
      var products = await ApiService().fetchProducts(
        limit: 10,
        page: page.value,
        sortOption: sortOption.value.isEmpty ? null : sortOption.value,
        category: category.value.isEmpty ? null : category.value,
        priceRange: priceRange.value.isEmpty ? null : priceRange.value,
        rating: rating.value.isEmpty ? null : rating.value,
      );
      if (products.isNotEmpty) {
        productList.addAll(products);
        page.value++;
      }
    } finally {
      isLoading(false);
      isLoadMore(false);
    }
  }
}
