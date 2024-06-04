import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../controllers/search_controller.dart' as custom_search;
import '../controllers/favorites_controller.dart';
import 'category_screen.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart'; // Import the SettingsScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.find();
  final custom_search.SearchController searchController = Get.put(custom_search.SearchController());
  final FavoritesController favoritesController = Get.put(FavoritesController());
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  final List<Widget> _pages = [
    ExplorePage(),
    FavoritesScreen(),
    Center(child: Text('Discover Screen Content')),
    SettingsScreen(), // Add the SettingsScreen to the list of pages
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  searchController.updateSearchQuery(value);
                  setState(() {
                    _isSearching = false;
                    _searchController.clear();
                  });
                },
              )
            : Obx(() {
                switch (userController.currentIndex.value) {
                  case 0:
                    return Text('Explore Places');
                  case 1:
                    return Text('Favorites');
                  case 2:
                    return Text('Discover');
                  case 3:
                    return Text('Settings');
                  default:
                    return Text('Home');
                }
              }),
        actions: [
          Obx(() {
            if (userController.currentIndex.value == 0) {
              return IconButton(
                icon: Icon(_isSearching ? Icons.clear : Icons.search),
                onPressed: () {
                  setState(() {
                    if (_isSearching) {
                      _searchController.clear();
                    }
                    _isSearching = !_isSearching;
                  });
                },
              );
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
      body: Obx(() => _pages[userController.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: userController.currentIndex.value,
        onTap: (int index) {
          userController.changeTabIndex(index);
        },
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 30),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: 'Settings',
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      )),
    );
  }
}

class ExplorePage extends StatelessWidget {
  final FavoritesController favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CATEGORY',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(CategoryScreen());
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryCard(title: 'Egypt'),
                SizedBox(width: 8),  // Add space between cards
                CategoryCard(title: 'Saudi Arabia'),
                SizedBox(width: 8),  // Add space between cards
                CategoryCard(title: 'Oman'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FavoritesController favoritesController = Get.find();
        favoritesController.addFavorite(title);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,  // Adjust width
        height: 80,  // Adjust height
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,  // Adjust font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
