import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchResults = <SearchResult>[].obs;
  var isLoading = false.obs;

  void updateSearchQuery(String query) {
    if (query.isEmpty) {
      searchResults.clear();
    } else {
      performSearch(query);
    }
  }

  void performSearch(String query) async {
    isLoading.value = true;
    // Simulate a delay for search operation
    await Future.delayed(Duration(seconds: 1));
    // Simulate search results
    searchResults.value = List.generate(10, (index) => SearchResult(
      title: 'Result $index for "$query"',
      description: 'Description for result $index',
    ));
    isLoading.value = false;
  }

  void clearSearchResults() {
    searchResults.clear();
  }
}

class SearchResult {
  final String title;
  final String description;

  SearchResult({required this.title, required this.description});
}
