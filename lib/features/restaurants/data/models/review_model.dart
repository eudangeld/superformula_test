import '../../domain/entities/review.dart';

class ReviewModel extends Review {
  ReviewModel({
    required super.rating,
    required super.text,
    required super.userName,
    required super.photoUrl,
  });

  factory ReviewModel.fromJson(dynamic data) {
    return ReviewModel(
      rating: data['rating'],
      text: data?['text'] ?? '',
      userName: data?['user']?['name'] ?? '',
      photoUrl: data?['user']?['image_url'] ?? '',
    );
  }
}
