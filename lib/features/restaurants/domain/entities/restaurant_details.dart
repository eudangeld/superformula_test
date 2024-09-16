import 'review.dart';

class RestaurantDetails {
  final String id;
  final bool isCLosed;
  final double rating;
  final String price;
  final String name;
  final String address;
  final String state;
  final String city;
  final String postalCode;
  final List<String> photos;
  final List<String> categories;
  final List<Review> reviews;

  RestaurantDetails({
    required this.id,
    required this.isCLosed,
    required this.categories,
    required this.rating,
    required this.price,
    required this.name,
    required this.address,
    required this.state,
    required this.city,
    required this.postalCode,
    required this.photos,
    required this.reviews,
  });
}
