import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String price;
  final List<String> photos;
  final double rating;
  final bool isCLosed;
  final String address;
  final List<String> categories;

  const Restaurant({
    required this.id,
    required this.name,
    required this.price,
    required this.photos,
    required this.rating,
    required this.isCLosed,
    required this.address,
    required this.categories,
  });

  @override
  List<Object?> get props =>
      [name, price, photos, rating, isCLosed, address, categories];
}
