class Restautant {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final int rating;
  final int count;
  final double latitude;
  final double longitude;

  Restautant({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.rating,
    required this.count,
    required this.latitude,
    required this.longitude,
  });

  // Método para crear una instancia de Restaurant a partir de un documento de Firestore
  factory Restautant.fromFirestore(String id, Map<String, dynamic> data) {
    return Restautant(
      id: id,
      name: data['name'] ?? 'No name',
      description: data['description'] ?? 'No description',
      images: List<String>.from(data['images'] ?? []),
      rating: data['rating'] ?? 0,
      count: data['count'] ?? 0,
      latitude: data['Latitud'], // Accede directamente si es tipo número
      longitude: data['Longitud'], // Accede directamente si es tipo número
    );
  }
}
