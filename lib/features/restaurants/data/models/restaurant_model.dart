import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant {
  RestaurantModel({
    required super.name,
    required super.price,
    required super.photos,
    required super.rating,
    required super.isCLosed,
    required super.address,
  });

  factory RestaurantModel.fromJson(dynamic data) {
    final List photos = data["photos"] ?? [];
    return RestaurantModel(
      name: data['name'] ?? 'No name',
      price: data['price'] ?? '',
      photos: photos.map<String>((e) => e).toList(),
      rating: data['rating'] ?? 0,
      isCLosed: data['is_closed'] ?? true,
      address: data['location']?['address1'] ?? 'No adrress',
    );
  }
}
