import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String name;
  final String price;
  final List<String> photos;
  final double rating;
  final bool isCLosed;
  final String address;

  const Restaurant({
    required this.name,
    required this.price,
    required this.photos,
    required this.rating,
    required this.isCLosed,
    required this.address,
  });

  @override
  List<Object?> get props => [name, price, photos, rating, isCLosed, address];
}
