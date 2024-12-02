import '../../domain/entities/barbershop.dart';

class BarbershopModel extends Barbershop {
  BarbershopModel({
    required String title,
    required String distance,
    required double rating,
    required String imageUrl,
    bool isRecommended = false,
  }) : super(
          title: title,
          distance: distance,
          rating: rating,
          imageUrl: imageUrl,
          isRecommended: isRecommended,
        );

  factory BarbershopModel.fromJson(Map<String, dynamic> json) {
    return BarbershopModel(
      title: json['title'],
      distance: json['distance'],
      rating: json['rating'],
      imageUrl: json['imageUrl'],
      isRecommended: json['isRecommended'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'distance': distance,
      'rating': rating,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
    };
  }
}
