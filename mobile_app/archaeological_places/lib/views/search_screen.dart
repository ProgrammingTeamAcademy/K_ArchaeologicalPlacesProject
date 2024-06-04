import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart' as custom; // Make sure to import your search controller

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final custom.SearchController _searchController = Get.find(); // Using alias

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onChanged: (query) {
            _searchController.updateSearchQuery(query);
          },
        ),
      ),
      body: Obx(() {
        if (_searchController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (_searchController.searchResults.isEmpty) {
          return Center(child: Text('No results found.'));
        } else {
          return ListView.builder(
            itemCount: _searchController.searchResults.length,
            itemBuilder: (context, index) {
              final result = _searchController.searchResults[index];
              return ListTile(
                title: Text(result.title),
                subtitle: Text(result.description),
                onTap: () {
                  // Handle result tap
                },
              );
            },
          );
        }
      }),
    );
  }
}
