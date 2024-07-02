import 'package:flutter/material.dart';
import '../models/archaeological_place.dart';

class PlaceCard extends StatelessWidget {
  final ArchaeologicalPlace place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(place.imageUrl),
        title: Text(place.name),
        subtitle: Text(place.description),
        onTap: () {
          // Navigate to place detail screen
        },
      ),
    );
  }
}
