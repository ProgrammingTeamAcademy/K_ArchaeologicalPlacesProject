class ArchaeologicalPlace {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  ArchaeologicalPlace({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory ArchaeologicalPlace.fromJson(Map<String, dynamic> json) {
    return ArchaeologicalPlace(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
