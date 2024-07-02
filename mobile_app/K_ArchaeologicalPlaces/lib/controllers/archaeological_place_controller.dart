import 'package:get/get.dart';
import '../models/archaeological_place.dart';
import '../services/api_service.dart';

class ArchaeologicalPlaceController extends GetxController {
  var places = <ArchaeologicalPlace>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPlaces();
    super.onInit();
  }

  void fetchPlaces() async {
    isLoading(true);
    try {
      var fetchedPlaces = await ApiService.fetchArchaeologicalPlaces();
      if (fetchedPlaces != null) {
        places.value = fetchedPlaces;
      }
    } finally {
      isLoading(false);
    }
  }

  void addPlace(ArchaeologicalPlace place) async {
    bool success = await ApiService.createArchaeologicalPlace(place);
    if (success) {
      places.add(place);
    }
  }

  void updatePlace(ArchaeologicalPlace place) async {
    bool success = await ApiService.updateArchaeologicalPlace(place);
    if (success) {
      int index = places.indexWhere((p) => p.id == place.id);
      if (index != -1) {
        places[index] = place;
      }
    }
  }

  void deletePlace(int id) async {
    bool success = await ApiService.deleteArchaeologicalPlace(id);
    if (success) {
      places.removeWhere((place) => place.id == id);
    }
  }
}
