import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoritesController extends GetxController {
  var favorites = <String>[].obs;
  late Box box;

  @override
  void onInit() {
    super.onInit();
    box = Hive.box('favoritesBox');
    loadFavorites();
  }

  void loadFavorites() {
    var savedFavorites = box.get('favorites', defaultValue: <String>[]);
    favorites.value = List<String>.from(savedFavorites);
  }

  void addFavorite(String item) {
    favorites.add(item);
    box.put('favorites', favorites);
  }

  void removeFavorite(String item) {
    favorites.remove(item);
    box.put('favorites', favorites);
  }
}
