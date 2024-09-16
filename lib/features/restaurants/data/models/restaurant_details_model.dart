import '../../domain/entities/restaurant_details.dart';
import 'review_model.dart';

class RestaurantDetailsModel extends RestaurantDetails {
  RestaurantDetailsModel({
    required super.isCLosed,
    required super.rating,
    required super.price,
    required super.name,
    required super.address,
    required super.state,
    required super.city,
    required super.postalCode,
    required super.photos,
    required super.categories,
    required super.reviews,
  });

  factory RestaurantDetailsModel.fromJson(dynamic data) {
    final List photos = data["photos"] ?? [];
    final List categories = data["categories"] ?? [];
    final List reviews = data['reviews'] ?? [];

    return RestaurantDetailsModel(
      name: data['name'] ?? 'No name',
      price: data['price'] ?? '',
      photos: photos.map<String>((e) => e).toList(),
      rating: data['rating'] ?? 0,
      categories:
          categories.map<String>((element) => element['title']).toList(),
      isCLosed: data['is_closed'] ?? true,
      address: data['location']?['address1'] ?? 'No adrress',
      postalCode: data['location']?['postal_code'] ?? '',
      city: data['location']?['city'] ?? '',
      state: data['location']?['state'] ?? '',
      reviews: reviews
          .map<ReviewModel>((review) => ReviewModel.fromJson(review))
          .toList(),
    );
  }
}
