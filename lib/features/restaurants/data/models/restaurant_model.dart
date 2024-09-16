import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant {
  const RestaurantModel({
    required super.id,
    required super.name,
    required super.price,
    required super.photos,
    required super.rating,
    required super.isCLosed,
    required super.address,
    required super.categories,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "photos": photos,
        "rating": rating,
        "is_closed": isCLosed,
        "location": {"address1": address},
      };

  factory RestaurantModel.fromJson(dynamic data) {
    final List photos = data["photos"] ?? [];
    final List categories = data["categories"] ?? [];
    return RestaurantModel(
      id: data['id'],
      name: data['name'] ?? 'No name',
      price: data['price'] ?? '',
      photos: photos.map<String>((e) => e).toList(),
      rating: data['rating'] ?? 0,
      categories:
          categories.map<String>((element) => element['title']).toList(),
      isCLosed: data['is_closed'] ?? true,
      address: data['location']?['address1'] ?? 'No adrress',
    );
  }
}
