import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      body: Obx(() {
        if (favoritesController.favorites.isEmpty) {
          return Center(child: Text('No favorites added'));
        } else {
          return ListView.builder(
            itemCount: favoritesController.favorites.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favoritesController.favorites[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    favoritesController.removeFavorite(favoritesController.favorites[index]);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
