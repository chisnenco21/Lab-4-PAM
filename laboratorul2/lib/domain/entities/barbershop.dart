class Barbershop {
  final String title;
  final String distance;
  final double rating;
  final String imageUrl;
  final bool isRecommended;

  Barbershop({
    required this.title,
    required this.distance,
    required this.rating,
    required this.imageUrl,
    this.isRecommended = false,
  });
}
